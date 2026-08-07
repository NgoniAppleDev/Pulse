//
//  ArticleRepository.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

protocol ArticleRepository {
    
    func fetchArticles() throws -> [Article]
    
    func refresh() async throws
}
