//
//  HRVManager.swift
//  StressWatchApp Watch App
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import Foundation
import HealthKit

class HRVManager: ObservableObject {
    private var healthStore = HKHealthStore()
    @Published var hrvValue: Double = 0.0

    init() {
        requestAuthorization()
    }
    
    private func requestAuthorization() {
        if HKHealthStore.isHealthDataAvailable() {
            let typesToRead: Set = [
                HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!
            ]
            
            healthStore.requestAuthorization(toShare: [], read: typesToRead) { success, error in
                DispatchQueue.main.async {
                    if success {
                        print("✅ HealthKit authorization successful")
                    } else {
                        print("❌ HealthKit authorization failed: \(error?.localizedDescription ?? "Unknown error")")
                    }
                }
            }
        }
    }

    func fetchHRV() {
        guard let hrvType = HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN) else { return }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: hrvType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, samples, error in
            guard let sample = samples?.first as? HKQuantitySample else { return }
            DispatchQueue.main.async {
                self.hrvValue = sample.quantity.doubleValue(for: HKUnit.secondUnit(with: .milli))
                print("Fetched HRV: \(self.hrvValue) ms")
            }
        }
        healthStore.execute(query)
    }
}
