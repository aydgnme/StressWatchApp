//
//  ColorfulBarWithRanges.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 13.04.2025.
//

import SwiftUI


struct ColorfulBarWithRanges: View {
    var hrv: Double

    private func normalizedPosition() -> CGFloat {
        let clampedHRV = min(max(hrv, 0), 120)
        return CGFloat(clampedHRV / 120)
    }

    private func rangeLabel(for hrv: Double) -> String {
        if hrv < 20 {
            return "CRITICAL stress"
        } else if hrv < 40 {
            return "HIGH stress"
        } else if hrv < 60 {
            return "MODERATE stress"
        } else if hrv < 80 {
            return "NORMAL"
        } else if hrv < 100 {
            return "RELAXED"
        } else {
            return "FULLY RECOVERED"
        }
    }
    
    private func indicatorColor(for hrv: Double) -> Color {
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
    
    var body: some View {
        VStack(spacing: 6) {

            Text(rangeLabel(for: hrv))
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 2)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: hrv)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Gradient Bar
                    LinearGradient(
                        colors: [.red, .orange, .yellow, .green, .blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(height: 5)
                    .cornerRadius(10)
                    
                    // Moving Circle Indicator
                    Circle()
                        .fill(.white)
                        .frame(width: 7, height: 7)
                        .offset(x: normalizedPosition() * geometry.size.width)
                        .shadow(radius: 3)
                        .animation(.easeInOut(duration: 0.5), value: hrv)
                }
            }
            .frame(height: 10)
        }
    }
}


#Preview {
    ColorfulBarWithRanges(hrv: 120)
}
