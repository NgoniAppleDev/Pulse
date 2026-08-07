//
//  NewsView.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import SwiftUI
import SwiftData

struct NewsView: View {
    
    @Query private var articles: [ArticleEntity]
    
    var body: some View {
        NavigationStack {
            List(articles) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    
                    Text(article.source)
                        .font(.caption)
                }
            }
            .navigationTitle("Pulse")
        }
    }
}

#Preview {
    NewsView()
}
