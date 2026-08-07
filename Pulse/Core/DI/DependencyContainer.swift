//
//  DependencyContainer.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData


@MainActor
final class DependencyContainer {
    
    let articleRepository: ArticleRepository
    
    let fetchArticlesUseCase: FetchArticlesUseCase
    
    init(context: ModelContext) {
        
        let repository =
        SwiftDataArticleRepository(context: context, api: MockNewsAPIService())
        
        self.articleRepository = repository
        
        self.fetchArticlesUseCase = FetchArticlesUseCase(repository: repository)
    }
}
