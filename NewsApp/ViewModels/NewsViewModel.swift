//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import SwiftUI

final class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var image = Image(systemName: "photo")
    
    func fetchImage(with article: Article) {
        guard let urlToImage = article.urlToImage else { return }
        NewsController.shared.fetchImage(from: urlToImage) { [weak self] (result) in
            switch result {
            case .success(let uiImage):
                DispatchQueue.main.async {
                    self?.image = Image(uiImage: uiImage)
                }
            case .failure(let error):
                self?.displayError(error, title: "Failed to fetch image")
            }
        }
    }
        
    func fetchArticles() {
        NewsController.shared.fetchArticles { [weak self] (result) in
            switch result {
            case .success(let newsArticles):
                DispatchQueue.main.async {
                    self?.articles = newsArticles
                }
            case .failure(let error):
                self?.displayError(error, title: "Failed to fetch news")
            }
        }
    }
    
    func displayError(_ error: Error, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
}
