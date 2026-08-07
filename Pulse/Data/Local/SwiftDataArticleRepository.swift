//
//  SwiftDataArticleRepository.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData


final class SwiftDataArticleRepository: ArticleRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchArticles() throws -> [Article] {
        
        let descriptor = FetchDescriptor<ArticleEntity>(
            sortBy: [SortDescriptor(\.publishedAt, order: .reverse)]
        )
        
        let entities = try context.fetch(descriptor)
        
        return entities.map { entity in
            Article(
                id: entity.uuid,
                title: entity.title,
                description: entity.articleDescription,
                imageURL: URL(string: entity.imageURL ?? ""),
                articleURL: URL(string: entity.articleURL)!,
                source: entity.source,
                language: entity.language,
                category: entity.category,
                publishedAt: entity.publishedAt
            )
        }
    }
}
