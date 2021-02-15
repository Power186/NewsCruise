//
//  CryptoCurrency.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import Foundation

struct CryptoCurrency: Codable {
    let status: String
    let data: CryptoData
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
}

struct CryptoData: Codable {
    let coins: [Coin]
    
    enum CodingKeys: String, CodingKey {
        case coins
    }
}

struct Coin: Codable, Hashable {
    let name: String
    let symbol: String
    let price: String
    let change: Double
    let websiteUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case price
        case change
        case websiteUrl
    }
}
