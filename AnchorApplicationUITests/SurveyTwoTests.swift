//
//  Survey2Tests.swift
//  AnchorApplicationUITests
//
//  Created by Tommy Li on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import XCTest

class Survey2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testA() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons["Start Assessment"].tap()
        // app.alerts["Assessment Result"].buttons["Continue to survey"].tap()
        app.buttons[" No"].tap()
        app.buttons[" Yes"].tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No motion slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        let element = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 13).children(matching: .other).element
        XCTAssertTrue(element.children(matching: .textView).element(boundBy: 0).exists)
        XCTAssertTrue(element.children(matching: .textView).element(boundBy: 1).exists)
    }
    
    func testB() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons["Start Assessment"].tap()
        // app.alerts["Assessment Result"].buttons["Continue to survey"].tap()
        let yesButton = app.buttons[" Yes"]
        yesButton.tap()
        yesButton.tap()
        let usuallyImprovesButton = app.buttons[" Usually improves"]
        usuallyImprovesButton.tap()
        let usuallyRelievedButton = app.buttons[" Usually relieved"]
        usuallyRelievedButton.tap()
        usuallyRelievedButton.tap()
        usuallyRelievedButton.tap()
        usuallyRelievedButton.tap()
        usuallyRelievedButton.tap()
        usuallyImprovesButton.tap()
        usuallyRelievedButton.tap()
        usuallyRelievedButton.tap()
        XCTAssertTrue(app.staticTexts["Increase frequency of Levodopa"].exists)
        XCTAssertTrue(app.staticTexts["Change to slow-release Levodopa"].exists)
        XCTAssertTrue(app.staticTexts["Add Dopamine Agonists"].exists)
    }
    
    func testC() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons["Start Assessment"].tap()
        // app.alerts["Assessment Result"].buttons["Continue to survey"].tap()
        let yesButton = app.buttons[" Yes"]
        yesButton.tap()
        yesButton.tap()
        let unimprovedButton = app.buttons[" Unimproved"]
        unimprovedButton.tap()
        let unrelievedButton = app.buttons[" Unrelieved"]
        unrelievedButton.tap()
        unrelievedButton.tap()
        unrelievedButton.tap()
        unrelievedButton.tap()
        unrelievedButton.tap()
        unimprovedButton.tap()
        unrelievedButton.tap()
        unrelievedButton.tap()
        XCTAssertTrue(app.staticTexts["Increase frequency of Levodopa"].exists)
    }
    
    func testD() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons["Start Assessment"].tap()
        // app.alerts["Assessment Result"].buttons["Continue to survey"].tap()
        let noButton = app.buttons[" No"]
        noButton.tap()
        noButton.tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No motion slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        XCTAssertTrue(app.staticTexts["Increase frequency of Levodopa"].exists)
        XCTAssertTrue(app.staticTexts["Change to slow-release Levodopa"].exists)
        XCTAssertTrue(app.staticTexts["Add Dopamine Agonists"].exists)
    }
}
