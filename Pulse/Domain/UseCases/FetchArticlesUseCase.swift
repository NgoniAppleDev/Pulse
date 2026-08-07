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
    
    func execute() async throws -> [Article] {
        try await repository.fetchArticles()
    }
    
    func refresh() async throws {
        try await repository.refresh()
    }
}
