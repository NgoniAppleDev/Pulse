//
//  ArticleEntity.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData

@Model
final class ArticleEntity {
    
    @Attribute(.unique)
    var uuid: String
    var title: String
    var articleDescription: String?
    var imageURL: String?
    var articleURL: String
    var source: String
    var language: String
    var publishedAt: Date
    
    @Relationship
    var categories: [CategoryEntity] = []
    
    init(
        uuid: String,
        title: String,
        articleDescription: String?,
        imageURL: String?,
        articleURL: String,
        source: String,
        language: String,
        publishedAt: Date
    ) {
        self.uuid = uuid
        self.title = title
        self.articleDescription = articleDescription
        self.imageURL = imageURL
        self.articleURL = articleURL
        self.source = source
        self.language = language
        self.publishedAt = publishedAt
    }
}
