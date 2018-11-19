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
    
    func testImmediateA() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Immediate Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("1")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        app.buttons[" No"].tap()
        app.buttons[" Yes"].tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No painful spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No movement slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        XCTAssertTrue(app.staticTexts["Decrease Levodopa dosage"].exists)
    }
    
    func testImmediateB() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Immediate Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("10000")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
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
        XCTAssertTrue(app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 14).children(matching: .other).element.children(matching: .textView).element.exists)
    }
    
    func testImmediateC() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Immediate Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("999999")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
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
    
    func testImmediateD() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Immediate Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("12345")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        let noButton = app.buttons[" No"]
        noButton.tap()
        noButton.tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No painful spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No movement slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        XCTAssertTrue(app.staticTexts["No adjustments required"].exists)
    }
    
    func testControlledA() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Controlled Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("500")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        app.buttons[" No"].tap()
        app.buttons[" Yes"].tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No painful spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No movement slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        XCTAssertTrue(app.staticTexts["Decrease Levodopa dosage"].exists)
    }
    
    func testControlledB() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Controlled Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("100")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
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
        XCTAssertTrue(app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 14).children(matching: .other).element.children(matching: .textView).element.exists)
    }
    
    func testControlledC() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Controlled Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("99")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
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
    
    func testControlledD() {
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons[" Controlled Release"].tap()
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("123")
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        let noButton = app.buttons[" No"]
        noButton.tap()
        noButton.tap()
        app.buttons[" No tremor post-dosing"].tap()
        app.buttons[" No stiffness post-dosing"].tap()
        app.buttons[" No painful spasms post-dosing"].tap()
        app.buttons[" No anxiety attacks post-dosing"].tap()
        app.buttons[" No movement slowness post-dosing"].tap()
        app.buttons[" No reduced dexterity post-dosing"].tap()
        app.buttons[" No mood changes post-dosing"].tap()
        app.buttons[" No muscle cramps post-dosing"].tap()
        app.buttons[" No cognitive impairment post-dosing"].tap()
        XCTAssertTrue(app.staticTexts["No adjustments required"].exists)
    }
}
