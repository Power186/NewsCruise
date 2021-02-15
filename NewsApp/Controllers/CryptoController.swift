//
//  CryptoController.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import Foundation

final class CryptoController {
    static let shared = CryptoController()
    
    enum CoinInfoError: Error, LocalizedError {
        case coinDataMissing
    }
    
    func fetchCoins(completion: @escaping (Result<CryptoCurrency, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v1/public/coins"
        components.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod", value: "24h")
        ]
        guard let url = components.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let coinInfo = try jsonDecoder.decode(CryptoCurrency.self, from: data)
                    completion(.success(coinInfo))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(CoinInfoError.coinDataMissing))
            }
        }
        task.resume()
    }
    
}
