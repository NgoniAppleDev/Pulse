//
//  NewsView.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import SwiftUI
import SwiftData

struct NewsView: View {
    
    @State private var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.articles) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    
                    Text(article.source)
                        .font(.caption)
                }
            }
            .navigationTitle("Pulse")
            .task {
                await viewModel.load()
                await viewModel.refresh()
            }
        }
    }
}

#Preview {
    PulseRootView()
}
