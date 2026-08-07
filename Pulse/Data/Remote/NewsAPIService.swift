//
//  NewsAPIService.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

protocol NewsAPIService {
    
    func fetchArticles() async throws -> [ArticleDTO]
}

struct MockNewsAPIService: NewsAPIService {
    
    func fetchArticles() async throws -> [ArticleDTO] {
        
        [
            ArticleDTO(
                uuid: "swift-concurrency-001",
                title: "Swift 6 Concurrency Explained",
                description: "Modern concurrency arrives in Swift.",
                imageURL: nil,
                url: "https://example.com/swift",
                source: "Apple",
                language: "en",
                categories: ["technology"],
                publishedAt: .now
            ),
            
            ArticleDTO(
                uuid: "swift-concurrency-002",
                title: "AI Changes Software Development",
                description: "Developers use AI tools daily.",
                imageURL: nil,
                url: "https://example.com/ai",
                source: "Tech News",
                language: "en",
                categories: ["technology"],
                publishedAt: .now
            )
        ]
    }
}
