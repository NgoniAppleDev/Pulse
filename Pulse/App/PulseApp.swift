//
//  PulseApp.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import SwiftUI
import SwiftData

@main
struct PulseApp: App {

    var body: some Scene {
        WindowGroup {
            NewsView()
        }
        .modelContainer(for: ArticleEntity.self)
    }
}
