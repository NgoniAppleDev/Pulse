//
//  CategoryEntity.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation
import SwiftData


@Model
final class CategoryEntity {
    
    @Attribute(.unique)
    var name: String
    
    @Relationship(inverse: \ArticleEntity.categories)
    var articles: [ArticleEntity] = []
    
    init(name: String) {
        self.name = name
    }
}
