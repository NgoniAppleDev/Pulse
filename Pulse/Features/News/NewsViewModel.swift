//
//  NewsViewModel.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import Observation

@Observable
final class NewsViewModel {
    
    private let fetchArticlesUseCase: FetchArticlesUseCase
    
    var articles: [Article] = []
    
    var errorMessage: String?
    
    init(fetchArticlesUseCase: FetchArticlesUseCase) {
        self.fetchArticlesUseCase = fetchArticlesUseCase
    }
    
    func loadArticles() {
        
        do {
            articles = try fetchArticlesUseCase.execute()
        }
        catch {
            errorMessage = error.localizedDescription
        }
    }
}
