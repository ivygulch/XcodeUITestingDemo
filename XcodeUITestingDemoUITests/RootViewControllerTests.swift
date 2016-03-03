//
//  RootViewControllerTests.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import XCTest

class RootViewControllerTests: XCTestCase {

    func testLastItemCellNotVisibleWithoutScrolling() {
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.element
        let lastItemCell = table.cells.containingType(.StaticText, identifier:"Last Item").element

        let lastItemCellTop = lastItemCell.frame.origin.y
        let appHeight = app.frame.size.height
        XCTAssertTrue(lastItemCellTop > appHeight)

        app.terminate()
    }

    func testLastItemCellVisibleAfterScrolling() {
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.element
        table.swipeUp()
        table.swipeUp()
        let lastItemCell = table.cells.containingType(.StaticText, identifier:"Last Item").element

        let lastItemCellTop = lastItemCell.frame.origin.y
        let appHeight = app.frame.size.height
        XCTAssertTrue(lastItemCellTop <= appHeight)

        app.terminate()
    }

    func testUseLaunchEnvironmentVariables() {
        let app = XCUIApplication()
        app.launchEnvironment = ["autoSegueID":"labelVCID"]
        app.launch()

        XCTAssert(app.navigationBars["LabelViewController"].exists)

        NSThread.sleepForTimeInterval(5)

        app.terminate()
    }

}
