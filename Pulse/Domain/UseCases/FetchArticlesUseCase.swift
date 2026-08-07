//
//  FetchArticlesUseCase.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

struct FetchArticlesUseCase {
    
    private let repository: ArticleRepository
    
    init(repository: ArticleRepository) {
        self.repository = repository
    }
    
    func execute() throws -> [Article] {
        try repository.fetchArticles()
    }
}
