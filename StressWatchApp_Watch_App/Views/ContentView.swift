//
//  ContentView.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var hrvManager: HRVManager

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let scalingFactor = min(width, height) / 200
            
            let emojiSize = scalingFactor * 80
            let infoButtonSize = scalingFactor * 30
            let bpmFontSize = scalingFactor * 32
            let labelFontSize = scalingFactor * 20
            let clockFontSize = scalingFactor * 25
            let barHeight = scalingFactor * 8

            VStack(spacing: height * 0.05) {
                // Top HRV value
                HStack (spacing: width * 0.02) {
                    Text("\(Int(hrvManager.hrvValue))")
                        .font(.system(size: bpmFontSize))
                        .foregroundColor(.white)

                    Text("bpm")
                        .font(.system(size: labelFontSize))
                        .foregroundColor(.pink)

                    Spacer()
                }
               // .padding(.top, -width * 0.2)
                .padding(.leading, width * 0.05)

                Spacer()

                // Emoji
                Circle()
                    .fill(backgroundColor(for: hrvManager.hrvValue))
                    .frame(width: emojiSize, height: emojiSize)
                    .overlay(
                        Text(emojiForHRV(hrvManager.hrvValue))
                            .font(.system(size: emojiSize * 0.8))
                    )

                Spacer()

                // HRV Colorful Bar
                ColorfulBarWithRanges(hrv: hrvManager.hrvValue)
                    .frame(height: barHeight)
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, height * 0.03)
                    .padding(.bottom, height * 0.03)

                // Info button + Clock
                HStack(alignment: .center, spacing: width * 0.04) {
                    Circle()
                        .fill(backgroundColor(for: hrvManager.hrvValue))
                        .frame(width: infoButtonSize, height: infoButtonSize)
                        .overlay(
                            Image(systemName: "info")
                                .foregroundColor(.white)
                                .font(.system(size: infoButtonSize * 0.6))
                        )

                    Text(currentTime())
                        .font(.system(size: clockFontSize))
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.top, height * 0.075)
                .padding(.horizontal, width * 0.05)
                .padding(.bottom, height * 0.05)
            }
            // 🆕 Background gradient burada!
            .frame(width: width, height: height)
            .background(
                LinearGradient(
                    colors: backgroundGradient(for: hrvManager.hrvValue),
                    startPoint: .top,
                    endPoint: .bottom

                )
                .frame(width: width * 2, height: height * 2)
            )
            .animation(.easeInOut(duration: 0.5), value: hrvManager.hrvValue)
            .onAppear {
                hrvManager.fetchHRV()
            }
        }
    }
    
    func currentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter.string(from: Date())
    }
    

    
    func emojiForHRV(_ hrv: Double) -> String {
        if hrv < 20 {
            return "😵‍💫"
        } else if hrv < 40 {
            return "😰"
        } else if hrv < 60 {
            return "😟"
        } else if hrv < 80 {
            return "🙂"
        } else if hrv < 100 {
            return "😌"
        } else {
            return "🧘"
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(HRVManager())
}

