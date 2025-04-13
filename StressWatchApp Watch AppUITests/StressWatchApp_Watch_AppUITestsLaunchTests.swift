//
//  StressWatchApp_Watch_AppUITestsLaunchTests.swift
//  StressWatchApp Watch AppUITests
//
//  Created by Mert Aydoğan on 12.04.2025.
//

import XCTest

final class StressWatchApp_Watch_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    @MainActor
    func testLaunchAndNavigate() throws {
        let app = XCUIApplication()
        app.launch()

        // Example: Tap the Info button
        let infoButton = app.buttons["infoButton"]
        if infoButton.exists {
            infoButton.tap()
        }
        
        // Take a screenshot after tapping the Info button
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "After Tapping Info Button"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
