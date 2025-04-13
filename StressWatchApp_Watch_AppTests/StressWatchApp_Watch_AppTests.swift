//
//  StressWatchApp_Watch_AppTests.swift
//  StressWatchApp Watch AppTests
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import Testing
@testable import StressWatchApp_Watch_App

struct StressWatchApp_Watch_AppTests {

    @Test func testInitialHRVValueIsZero() async throws {
        let manager = HRVManager()
        #expect(manager.hrvValue == 0.0)
    }
    
    @Test func testManualHRVSetting() async throws {
        let manager = HRVManager()
        manager.hrvValue = 55.0
        #expect(manager.hrvValue == 55.0)
    }

}
