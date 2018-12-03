//
//  AnchorApplicationUITests.swift
//  AnchorApplicationUITests
//
//  Created by Keith Leung on 10/25/18.
//  Modified by Tommy Li on 11/01/18.s
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import XCTest

class AnchorApplicationUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHomePage() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["Home"].exists)
        XCTAssertTrue(app.otherElements.containing(.image, identifier:"homeIcon").element.exists)
        XCTAssertTrue(app.buttons[" Decision Survey"].exists)
        XCTAssertTrue(app.buttons[" Adjustment Survey"].exists)
        XCTAssertTrue(app.buttons[" Drug Information"].exists)
        XCTAssertTrue(app.buttons[" Progress Monitor"].exists)
        app.buttons[" Progress Monitor"].tap()
        app.buttons[" Back"].tap()
    }
    
    func testDrugInformation() {
        let app = XCUIApplication()
        app.buttons[" Drug Information"].tap()
        XCTAssertTrue(app.staticTexts["Drug Class"].exists)
        XCTAssertTrue(app.staticTexts["Select a drug class:"].exists)
        XCTAssertTrue(app.buttons[" Dopamine Agonists"].exists)
        XCTAssertTrue(app.buttons[" Levodopa"].exists)
        XCTAssertTrue(app.buttons[" Back"].exists)
        
        app.buttons[" Dopamine Agonists"].tap()
        XCTAssertTrue(app.tables.otherElements["Dopamine Agonists"].exists)
        app.tables["Empty list"].staticTexts["Bromocriptine"].tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables.staticTexts["Bromocriptine"].tap()
        app.tables["Empty list"].staticTexts["Pramipexole"].tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables.staticTexts["Pramipexole"].tap()
        app.tables["Empty list"].staticTexts["Ropinirole"].tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables.staticTexts["Ropinirole"].tap()
        app.tables["Empty list"].staticTexts["Rotigotine"].tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables.staticTexts["Rotigotine"].tap()
        app.tables.buttons["Back"].tap()
        
        app.buttons[" Levodopa"].tap()
        XCTAssertTrue(app.tables["Empty list"].otherElements["Levodopa"].exists)
        app.tables["Empty list"].staticTexts["Levodopa/carbidopa, immediate- release"].tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/carbidopa, immediate- release"]/*[[".otherElements[\"Levodopa\/carbidopa, immediate- release\"].staticTexts[\"Levodopa\/carbidopa, immediate- release\"]",".staticTexts[\"Levodopa\/carbidopa, immediate- release\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables["Empty list"]/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/carbidopa, controlled- release"]/*[[".otherElements[\"Levodopa\/carbidopa, controlled- release\"].staticTexts[\"Levodopa\/carbidopa, controlled- release\"]",".staticTexts[\"Levodopa\/carbidopa, controlled- release\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/carbidopa, controlled- release"]/*[[".otherElements[\"Levodopa\/carbidopa, controlled- release\"].staticTexts[\"Levodopa\/carbidopa, controlled- release\"]",".staticTexts[\"Levodopa\/carbidopa, controlled- release\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables["Empty list"]/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/carbidopa, intestinal gel"]/*[[".otherElements[\"Levodopa\/carbidopa, intestinal gel\"].staticTexts[\"Levodopa\/carbidopa, intestinal gel\"]",".staticTexts[\"Levodopa\/carbidopa, intestinal gel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/carbidopa, intestinal gel"]/*[[".otherElements[\"Levodopa\/carbidopa, intestinal gel\"].staticTexts[\"Levodopa\/carbidopa, intestinal gel\"]",".staticTexts[\"Levodopa\/carbidopa, intestinal gel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables["Empty list"]/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/benserazide"]/*[[".otherElements[\"Levodopa\/benserazide\"].staticTexts[\"Levodopa\/benserazide\"]",".staticTexts[\"Levodopa\/benserazide\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.tables.staticTexts["Type"].exists)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Levodopa/benserazide"]/*[[".otherElements[\"Levodopa\/benserazide\"].staticTexts[\"Levodopa\/benserazide\"]",".staticTexts[\"Levodopa\/benserazide\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testDecisionSurvey() {
        let app = XCUIApplication()
        let decisionSurveyButton = app.buttons[" Decision Survey"]
        let proceedButton = app.buttons["Proceed "]
        let bilateralButton = app.buttons[" Bilateral"]
        let noButton = app.buttons[" NO"]
        let yesButton = app.buttons[" YES"]
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .textView).element
        
        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        app.buttons[" Unilateral"].tap()
        XCTAssertTrue(textView.exists)
        XCUIApplication().buttons[" Home"].tap()

        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        bilateralButton.tap()
        noButton.tap()
        app.buttons[" over 60"].tap()
        XCTAssertTrue(app.buttons["Levodopa"].exists)
        app.buttons[" Home"].tap()
        
        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        bilateralButton.tap()
        noButton.tap()
        app.buttons[" below 60"].tap()
        XCTAssertTrue(app.buttons["Dopamine Agonists"].exists)
        app.buttons[" Home"].tap()
        
        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        bilateralButton.tap()
        yesButton.tap()
        yesButton.tap()
        app.buttons[" below 60"].tap()
        XCTAssertTrue(app.buttons["Dopamine Agonists"].exists)
        app.buttons[" Home"].tap()
        
        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        bilateralButton.tap()
        yesButton.tap()
        yesButton.tap()
        app.buttons[" over 60"].tap()
        XCTAssertTrue(app.buttons["Levodopa"].exists)
        app.buttons[" Home"].tap()
        
        decisionSurveyButton.tap()
        app.switches.element(boundBy: 0).tap()
        proceedButton.tap()
        bilateralButton.tap()
        yesButton.tap()
        noButton.tap()
        XCTAssertTrue(app.buttons["Levodopa"].exists)
        app.buttons[" Home"].tap()
    }
 }
