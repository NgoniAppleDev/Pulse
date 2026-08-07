//
//  ArticleDTO.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

struct ArticleDTO: Identifiable {
    
    let id = UUID()
    
    let uuid: String
    
    let title: String
    
    let description: String?
    
    let imageURL: String?
    
    let url: String
    
    let source: String
    
    let language: String
    
    let category: String
    
    let publishedAt: Date
}
