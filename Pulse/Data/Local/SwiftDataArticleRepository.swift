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
                    category: entity.category,
                    publishedAt: entity.publishedAt
                )
            }
    }
    
    
    func refresh() async throws {
        
        let remoteArticles = try await api.fetchArticles()
        
        for article in remoteArticles {
            let uuid = article.uuid
            
            let descriptor = FetchDescriptor<ArticleEntity>(
                predicate: #Predicate { $0.uuid == uuid }
            )
            
            if let existingArticle = try context.fetch(descriptor).first {
                
                existingArticle.title = article.title
                existingArticle.articleDescription = article.description
                existingArticle.imageURL = article.imageURL
                existingArticle.articleURL = article.url
                existingArticle.source = article.source
                existingArticle.language = article.language
                existingArticle.category = article.category
                existingArticle.publishedAt = article.publishedAt
                
            } else {
                
                let newArticle = ArticleEntity(
                    uuid: article.uuid,
                    title: article.title,
                    articleDescription: article.description,
                    imageURL: article.imageURL,
                    articleURL: article.url,
                    source: article.source,
                    language: article.language,
                    category: article.category,
                    publishedAt: article.publishedAt
                )
                
                context.insert(newArticle)
            }
        }
        
        try context.save()
    }
}
