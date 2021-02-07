//
//  NewsController.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import UIKit

final class NewsController {
    static let shared = NewsController()
    
    enum PhotoInfoError: Error, LocalizedError {
        case imageDataMissing
    }

    func fetchImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data,
               let image = UIImage(data: data) {
                completion(.success(image))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(PhotoInfoError.imageDataMissing))
            }
        }
        task.resume()
    }

    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c1ae0ffd14fb45119c1d81afc0c5e33c")
        guard let domainUrl = url else { return }
        
        let task = URLSession.shared.dataTask(with: domainUrl) { (data, _, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let newsInfo = try jsonDecoder.decode(News.self, from: data)
                    completion(.success(newsInfo.articles))
                } catch {
                    completion(.failure(error))
                }
            } else {
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

}
