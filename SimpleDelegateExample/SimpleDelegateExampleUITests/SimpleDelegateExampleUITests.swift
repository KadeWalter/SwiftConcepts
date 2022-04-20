//
//  SimpleDelegateExampleUITests.swift
//  SimpleDelegateExampleUITests
//
//  Created by Kade Walter on 4/20/22.
//

import XCTest

class SimpleDelegateExampleUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testColorSelection() {
        // Tap the Pick Color button to navigate screens.
        app/*@START_MENU_TOKEN@*/.buttons["Pick Color"].staticTexts["Pick Color"]/*[[".buttons[\"Pick Color\"].staticTexts[\"Pick Color\"]",".staticTexts[\"Pick Color\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        // Verify the green color cell exists.
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.exists)
                        
        // Select the green color cell.
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        // Verify the pick color button exists, meaning we tranistioned back to the home screen after the delegate function was called.
        XCTAssert(app.buttons["Pick Color"].exists)
    }
}
