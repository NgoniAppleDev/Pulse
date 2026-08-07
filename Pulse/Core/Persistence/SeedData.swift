//
//  SeedData.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData

enum SeedData {
    
    static func insertArticles(into context: ModelContext) {
        
        let articles = [
            ArticleEntity(
                title: "Swift 6 Brings Modern Concurrency",
                articleURL: "https://example.com/swift",
                source: "Apple",
                language: "en",
                category: "technology",
                publishedAt: .now
            ),
            
            ArticleEntity(
                title: "New AI Models Transform Development",
                articleURL: "https://example.com/ai",
                source: "Tech Daily",
                language: "en",
                category: "technology",
                publishedAt: .now
            ),
            
            ArticleEntity(
                title: "Global Sports Championship Begins",
                articleURL: "https://example.com/sports",
                source: "Sports Network",
                language: "en",
                category: "sports",
                publishedAt: .now
            )
        ]
        
        for article in articles {
            context.insert(article)
        }
        
        try? context.save()
    }
}
