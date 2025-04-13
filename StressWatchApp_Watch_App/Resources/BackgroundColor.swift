//
//  BackgroundColor.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 13.04.2025.
//

import Foundation
import SwiftUI

func backgroundGradient(for hrv: Double) -> [Color] {
    if hrv < 20 {
        return [Color.red.opacity(0.7), Color.red.opacity(0.1)]
    } else if hrv < 40 {
        return [Color.orange.opacity(0.7), Color.orange.opacity(0.1)]
    } else if hrv < 60 {
        return [Color.yellow.opacity(0.7), Color.yellow.opacity(0.1)]
    } else if hrv < 80 {
        return [Color.green.opacity(0.7), Color.green.opacity(0.1)]
    } else if hrv < 100 {
        return [Color.blue.opacity(0.7), Color.blue.opacity(0.1)]
    } else {
        return [Color.purple.opacity(0.7), Color.purple.opacity(0.1)]
    }
}

func backgroundColor(for hrv: Double) -> Color {
    if hrv < 20 {
        return .red
    } else if hrv < 40 {
        return .orange
    } else if hrv < 60 {
        return .yellow
    } else if hrv < 80 {
        return .green
    } else if hrv < 100 {
        return .blue
    } else {
        return .purple
    }
}
