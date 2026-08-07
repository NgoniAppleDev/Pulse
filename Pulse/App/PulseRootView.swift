//
//  PulseRootView.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import SwiftUI
import SwiftData

struct PulseRootView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var articles: [ArticleEntity]
    
    var body: some View {
        
        let container = DependencyContainer(context: modelContext)
        
        NewsView(
            viewModel: .init(fetchArticlesUseCase: container.fetchArticlesUseCase)
        )
    }
}

#Preview {
    PulseRootView()
        .modelContainer(for: ArticleEntity.self, inMemory: true)
}
