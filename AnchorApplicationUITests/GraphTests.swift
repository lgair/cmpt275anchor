//
//  GraphTests.swift
//  AnchorApplicationUITests
//
//  Created by Tommy Li on 2018-12-02.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import XCTest

class GraphTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testControlled() {
        let app = XCUIApplication()
        app.buttons[" Progress Monitor"].tap()
        app/*@START_MENU_TOKEN@*/.buttons[" Controlled Release"]/*[[".scrollViews.buttons[\" Controlled Release\"]",".buttons[\" Controlled Release\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.children(matching: .textField).element.tap()
        app.scrollViews.children(matching: .textField).element.typeText("500")
        app.tap()
        app.buttons["Proceed "].tap()
        let generateButton = app.buttons["Generate"]
        generateButton.tap()
        app.buttons[" Start Date"].tap()
        app.sheets["Start Date"].buttons["2018-11-25"].tap()
        app.buttons[" End Date"].tap()
        app.sheets["End Date"].buttons["2018-11-26"].tap()
        generateButton.tap()
        app.buttons["save"].tap()
    }
    
    func testImmediate() {
        let app = XCUIApplication()
        app.buttons[" Progress Monitor"].tap()
        app.buttons[" Immediate Release"].tap()
        app.scrollViews.children(matching: .textField).element.tap()
        app.scrollViews.children(matching: .textField).element.typeText("3")
        app.tap()
        app.buttons["Proceed "].tap()
        let generateButton = app.buttons["Generate"]
        generateButton.tap()
        app.buttons[" Start Date"].tap()
        app.sheets["Start Date"].buttons["2018-11-25"].tap()
        app.buttons[" End Date"].tap()
        app.sheets["End Date"].buttons["2018-11-26"].tap()
        generateButton.tap()
        app.buttons["save"].tap()
    }
    
    func testPop(){
        
        let app = XCUIApplication()
        app.buttons[" Adjustment Survey"].tap()
        app.switches.element(boundBy: 0).tap()
        app.buttons["Proceed "].tap()
        app.buttons["Start Assessment"].tap()
        app.buttons["Continue to survey"].tap()
//        let assessmentResultAlert = app.alerts["Assessment Result"]
//        assessmentResultAlert.staticTexts["Assessment Result"].tap()
//        assessmentResultAlert.staticTexts["Predominant problem is end-of-dose \"wearing off\"."].tap()
// assessmentResultAlert.buttons["Continue to survey"].tap()
                
    }
 }

