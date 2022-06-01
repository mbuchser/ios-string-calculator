//
//  StringCalcUITests.swift
//  StringCalcUITests
//
//  Created by Marc Buchser on 26.05.22.
//

import XCTest

class StringCalcUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testAddingNumbers() throws{
        let app = XCUIApplication()
        app.launch()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).typeText("1,2,3")
        app.buttons["Add numbers"].tap()
        let resultField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1)
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1).tap()
        XCTAssertEqual(resultField.value as! String, "6")
        
    }
    
    func testAddingNumbersWithWrongDelimiter() throws{
        let app = XCUIApplication()
        app.launch()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).typeText("1:2:3")
        app.buttons["Add numbers"].tap()
        let resultField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1)
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1).tap()
        XCTAssertEqual(resultField.value as! String, "0")
        
    }

    func testAddingWithoutNumbers() throws {
        let app = XCUIApplication()
        app.launch()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).tap()
        app.buttons["Add numbers"].tap()
        let resultField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1)
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1).tap()
        XCTAssertEqual(resultField.value as! String, "Input needed (eg 1,2,3)")
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
