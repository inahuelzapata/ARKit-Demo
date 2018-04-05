//
//  ARKit_DemoUITests.swift
//  ARKit-DemoUITests
//
//  Created by Nahuel Zapata on 04/04/2018.
//  Copyright © 2018 IntiveFDV. All rights reserved.
//

import XCTest

class ARKitDemoUITests: XCTestCase {

    override func setUp() {
        super.setUp()
      continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
    }
}
