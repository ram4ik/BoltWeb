//
//  BoltWebUITests.swift
//  BoltWebUITests
//
//  Created by Ramill Ibragimov on 10.06.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import XCTest

class BoltWebUITests: XCTestCase {

    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    override func setUp() {
        safari.launch()
    }
    
    override func tearDown() {
        safari.terminate()
    }
    
    func testBoltWeb() throws {
        
        let app = XCUIApplication()
        
        _ = safari.wait(for: .runningForeground, timeout: 30)
        
        safari.buttons["URL"].tap()
        
        safari.typeText("https://bolt.eu/")
        safari.keyboards.buttons["Go"].tap()
        
        _ = app.wait(for: .runningForeground, timeout: 5)
        //print(safari.debugDescription)
        
        safari.webViews["WebView"].buttons["menu button"].tap()
        _ = app.wait(for: .runningForeground, timeout: 5)
        
        safari.webViews["WebView"].buttons["menu button"].tap()
        _ = app.wait(for: .runningForeground, timeout: 5)
        
        for _ in 1...6 {
            safari.webViews["WebView"].swipeUp()
        }
        
        safari.webViews["WebView"].staticTexts["Cities"].tap()
        _ = app.wait(for: .runningForeground, timeout: 5)
    }
}
