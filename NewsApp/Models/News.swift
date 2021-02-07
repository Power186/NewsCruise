//
//  News.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import Foundation

struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: URL?
    let urlToImage: URL?
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
    }
}

struct News: Codable {
    var articles: [Article]
}
