//
//  ColorfulBar.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import SwiftUI

struct ColorfulBar: View {
    var body: some View {
        LinearGradient(
            colors: [.red, .orange, .yellow, .green, .blue, .purple],
            startPoint: .leading,
            endPoint: .trailing
        )
        .cornerRadius(3)
    }
}
