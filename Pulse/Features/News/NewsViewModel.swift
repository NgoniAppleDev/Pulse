//
//  NewsViewModel.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import Observation

@MainActor @Observable
final class NewsViewModel {
    
    var articles: [Article] = []
    
    private let fetchArticlesUseCase: FetchArticlesUseCase
    private let repository: ArticleRepository
    
    init(fetchArticlesUseCase: FetchArticlesUseCase, repository: ArticleRepository) {
        self.fetchArticlesUseCase = fetchArticlesUseCase
        self.repository = repository
    }
    
    
    func load() async {
        
        do {
            articles = try await fetchArticlesUseCase.execute()
        } catch {
            print(error)
        }
    }
    
    
    func refresh() async {
        
        do {
            
            try await repository.refresh()
            
            await load()
            
        } catch {
            
            print(error)
        }
    }
}
