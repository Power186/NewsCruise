//
//  CoinListViewModel.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import SwiftUI

final class CoinListViewModel: ObservableObject {
    @Published var coinViewModels = [CoinViewModel]()
    
    func fetchCoins() {
        CryptoController.shared.fetchCoins { [weak self] (result) in
            switch result {
            case .success(let cryptoCurrency):
                DispatchQueue.main.async {
                    self?.coinViewModels = cryptoCurrency.data.coins.map { CoinViewModel($0) }
                }
            case .failure(let error):
                self?.displayError(error, title: "Failed to fetch crypto currency")
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
