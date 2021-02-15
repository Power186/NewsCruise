//
//  CoinViewModel.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import Foundation

struct CoinViewModel: Hashable {
    private let coin: Coin
    
    init(_ coin: Coin) {
        self.coin = coin
    }
    
    var name: String {
        return coin.name
    }
    
    var symbol: String {
        return coin.symbol
    }
    
    var price: String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.locale = .autoupdatingCurrent
//        numberFormatter.numberStyle = .currency
//
//        guard let price = Double(coin.price),
//              let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) else { return "" }
        return coin.price.currencyFormat()
    }
    
    var change: String {
        let stringCoinChange = String(coin.change)
        return stringCoinChange.percentFormat()
    }
    
    var websiteUrl: String? {
        return coin.websiteUrl
    }
    
}


