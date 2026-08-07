//
//  SwiftDataArticleRepository.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData

@MainActor
final class SwiftDataArticleRepository: ArticleRepository {
    
    private let context: ModelContext
    private let api: any NewsAPIService
    
    init(context: ModelContext, api: any NewsAPIService) {
        self.context = context
        self.api = api
    }
    
    func fetchArticles() throws -> [Article] {
        
        let descriptor = FetchDescriptor<ArticleEntity>(
            sortBy: [ SortDescriptor(\.publishedAt, order: .reverse) ]
        )
        
        return try context.fetch(descriptor).map { entity in
            Article(
                id: entity.uuid,
                title: entity.title,
                description: entity.articleDescription,
                imageURL: URL(string: entity.imageURL ?? ""),
                articleURL: URL(string: entity.articleURL)!,
                source: entity.source,
                language: entity.language,
                categories: entity.categories.map { $0.name },
                publishedAt: entity.publishedAt
            )
        }
    }

    func refresh() async throws {
        
        let remoteArticles = try await api.fetchArticles()
        
        
        for article in remoteArticles {
            
            let categories =
            try categoryEntities(
                from: article.categories
            )
            
            
            let uuid = article.uuid
            
            let descriptor =
            FetchDescriptor<ArticleEntity>(
                predicate: #Predicate {
                    $0.uuid == uuid
                }
            )
            
            
            if let existing =
                try context.fetch(descriptor).first {
                
                existing.title = article.title
                existing.articleDescription = article.description
                existing.imageURL = article.imageURL
                existing.articleURL = article.url
                existing.source = article.source
                existing.language = article.language
                existing.categories = categories
                existing.publishedAt = article.publishedAt
                
                
            } else {
                
                let entity =
                makeArticleEntity(
                    from: article,
                    categories: categories
                )
                
                context.insert(entity)
            }
        }
        
        
        try context.save()
    }
    
    private func categoryEntities(from names: [String]) throws -> [CategoryEntity] {
        
        var result: [CategoryEntity] = []
        
        for name in names {
            
            let descriptor = FetchDescriptor<CategoryEntity>(
                
                predicate: #Predicate {
                    
                    $0.name == name
                    
                }
                
            )
            
            if let existing =
                
                try context.fetch(descriptor).first {
                
                result.append(existing)
                
            } else {
                
                let category = CategoryEntity(
                    
                    name: name
                    
                )
                
                context.insert(category)
                
                result.append(category)
                
            }
            
        }
        
        return result
    }
    
    private func makeArticleEntity(
        from article: ArticleDTO,
        categories: [CategoryEntity]
    ) -> ArticleEntity {
        
        let entity = ArticleEntity(
            uuid: article.uuid,
            title: article.title,
            articleDescription: article.description,
            imageURL: article.imageURL,
            articleURL: article.url,
            source: article.source,
            language: article.language,
            publishedAt: article.publishedAt
        )
        
        entity.categories = categories
        
        return entity
    }
    
    private func makeDomainArticle(
        from entity: ArticleEntity
    ) -> Article {
        
        Article(
            id: entity.uuid,
            title: entity.title,
            description: entity.articleDescription,
            imageURL: URL(string: entity.imageURL ?? ""),
            articleURL: URL(string: entity.articleURL)!,
            source: entity.source,
            language: entity.language,
            categories: entity.categories.map {
                $0.name
            },
            publishedAt: entity.publishedAt
        )
    }
}
