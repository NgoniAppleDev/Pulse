//
//  ArticleDTO.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

struct ArticleDTO: Decodable {
    
    let uuid: String
    let title: String
    let description: String?
    let imageURL: String?
    let url: String
    let source: String
    let language: String
    let categories: [String]
    let publishedAt: Date
    
    enum CodingKeys: String, CodingKey {
        
        case uuid
        case title
        case description
        case imageURL = "image_url"
        case url
        case source
        case language
        case categories
        case publishedAt = "published_at"
    }
}
