//
//  StressWatchAppApp.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import SwiftUI

@main
struct StressWatchAppApp: App {
    @StateObject private var hrvManager = HRVManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(hrvManager)
        }
    }
}
