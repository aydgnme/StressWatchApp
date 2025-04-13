//
//  NotificationManager.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import UserNotifications

class NotificationManager {
    static func sendStressAlert() {
        let content = UNMutableNotificationContent()
        content.title = "Stress Alert"
        content.body = "Your stress level is high. Take a break!"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
    }
}
