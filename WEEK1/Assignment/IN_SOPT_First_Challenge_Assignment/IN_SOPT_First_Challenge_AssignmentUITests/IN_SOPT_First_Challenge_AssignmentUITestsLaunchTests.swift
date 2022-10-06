//
//  IN_SOPT_First_Challenge_AssignmentUITestsLaunchTests.swift
//  IN_SOPT_First_Challenge_AssignmentUITests
//
//  Created by 류희재 on 2022/10/06.
//

import XCTest

final class IN_SOPT_First_Challenge_AssignmentUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
