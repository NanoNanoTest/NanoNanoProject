//
//  HomeScreenTest.swift
//  NanoNanoUITests
//
//  Created by Dzulfikar on 24/08/23.
//

import XCTest

final class HomeScreenTest: XCTestCase {
    var app: XCUIApplication? = nil
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testAppFlow() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // Find The Pokemon Navigation Title
        let navigationTitle = app.navigationBars["Pokemon"].staticTexts["Pokemon"]
        XCTAssertTrue(navigationTitle.waitForExistence(timeout: 0.1))
        
        // Find The Pokemon Search Bar
        let searchField = app.navigationBars["Pokemon"].searchFields["Search"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 0.1))
        
        // Find The Pokemon Scroll View
        let scrollViews = app.scrollViews["scrollView"]
        XCTAssertTrue(scrollViews.waitForExistence(timeout: 0.2))
        
        // Find the pokemon list
        let pokemonItems = scrollViews.children(matching: .other)
        XCTAssertTrue(pokemonItems.element.waitForExistence(timeout: 0.2))
        
        // Tap the search bar
        searchField.tap()
        
        // input bulbasaur
        app.keys["B"].tap()
        app.keys["u"].tap()
        app.keys["l"].tap()
        app.keys["b"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["a"].tap()
        app.keys["u"].tap()
        app.keys["r"].tap()
        
        // find the bulbasaur element
        let bulbasaur = scrollViews.otherElements.buttons["bulbasaur"]
        XCTAssertTrue(bulbasaur.waitForExistence(timeout: 0.2))
        
        // Tap the bulbasaur element
        bulbasaur.tap()
        
        // Find the bulbasaur text
        let bulbasaurNavigationTitle = app/*@START_MENU_TOKEN@*/.otherElements["mainView"].staticTexts["bulbasaur"]/*[[".otherElements[\"mainView\"]",".staticTexts[\"bulbasaur\"]",".staticTexts[\"itemDetailView\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[2,1]]@END_MENU_TOKEN@*/
        XCTAssertTrue(bulbasaurNavigationTitle.waitForExistence(timeout: 0.2))
    }
    
    func testMemoryPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTMemoryMetric()]) {
                let app = XCUIApplication()
                app.launch()
                
                // Find The Pokemon Navigation Title
                let navigationTitle = app.navigationBars["Pokemon"].staticTexts["Pokemon"]
                XCTAssertTrue(navigationTitle.waitForExistence(timeout: 0.5))
                
                // Find The Pokemon Search Bar
                let searchField = app.navigationBars["Pokemon"].searchFields["Search"]
                XCTAssertTrue(searchField.waitForExistence(timeout: 0.5))
                
                // Find The Pokemon Scroll View
                let scrollViews = app.scrollViews["scrollView"]
                XCTAssertTrue(scrollViews.waitForExistence(timeout: 0.5))
                
                // Find the pokemon list
                let pokemonItems = scrollViews.children(matching: .other)
                XCTAssertTrue(pokemonItems.element.waitForExistence(timeout: 0.5))
                
                // Tap the search bar
                searchField.tap()
                
                // input bulbasaur
                app.keys["B"].tap()
                app.keys["u"].tap()
                app.keys["l"].tap()
                app.keys["b"].tap()
                app.keys["a"].tap()
                app.keys["s"].tap()
                app.keys["a"].tap()
                app.keys["u"].tap()
                app.keys["r"].tap()
                
                // find the bulbasaur element
                let bulbasaur = scrollViews.otherElements.buttons["bulbasaur"]
                XCTAssertTrue(bulbasaur.waitForExistence(timeout: 0.5))
                
                // Tap the bulbasaur element
                bulbasaur.tap()
                
                // Find the bulbasaur text
                let bulbasaurNavigationTitle = app/*@START_MENU_TOKEN@*/.otherElements["mainView"].staticTexts["bulbasaur"]/*[[".otherElements[\"mainView\"]",".staticTexts[\"bulbasaur\"]",".staticTexts[\"itemDetailView\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[2,1]]@END_MENU_TOKEN@*/
                XCTAssertTrue(bulbasaurNavigationTitle.waitForExistence(timeout: 0.5))
            }
        }
    }
}
