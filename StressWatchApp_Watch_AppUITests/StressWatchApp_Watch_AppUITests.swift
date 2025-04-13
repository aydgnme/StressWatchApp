//
//  StressWatchApp_Watch_AppUITests.swift
//  StressWatchApp Watch AppUITests
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import XCTest

final class StressWatchApp_Watch_AppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    @MainActor
    func testContentViewElementsExist() throws {
        let app = XCUIApplication()
        app.launch()
        
        // 1. Check if HRV value (bpm) text exists
        let hrvValue = app.staticTexts.element(boundBy: 0)
        XCTAssertTrue(hrvValue.exists, "HRV value (bpm) is not visible.")

        // 2. Check if "bpm" label exists
        let bpmLabel = app.staticTexts["bpm"]
        XCTAssertTrue(bpmLabel.exists, "The 'bpm' label is not visible.")

        // 3. Check if the emoji is displayed
        let emoji = app.staticTexts.containing(NSPredicate(format: "label MATCHES %@", "😵‍💫|😰|😟|🙂|😌|🧘")).element
        XCTAssertTrue(emoji.exists, "The emoji is not visible.")

        // 4. Check if the info button exists
        let infoButton = app.images["info"] // Using SF Symbol "info"
        XCTAssertTrue(infoButton.exists, "The info button is not visible.")

        // 5. Check if the clock text exists
        // Since the clock text is dynamic, just check if it exists
        let clockText = app.staticTexts.element(boundBy: 2) // Typically the third static text
        XCTAssertTrue(clockText.exists, "The clock text is not visible.")
    }
}
