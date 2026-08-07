//
//  Article.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

struct Article: Identifiable {
    
    let id: String
    
    let title: String
    
    let description: String?
    
    let imageURL: URL?
    
    let articleURL: URL
    
    let source: String
    
    let language: String
    
    let category: String
    
    let publishedAt: Date
}
