//
//  SearchModel.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import Foundation

// MARK: - Welcome
struct SearchApiModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article1]?
}

// MARK: - Article
struct Article1: Codable {
    let source: Source1?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source1: Codable {
    let id: String?
    let name: String?
}
