//
//  CFAlertViewControllerDemoTests.swift
//  CFAlertViewControllerDemoTests
//
//  Created by Shardul Patel on 29/06/17.
//  Copyright © 2017 Codigami Inc. All rights reserved.
//

import XCTest
@testable import CFAlertViewControllerDemo

class CFAlertViewControllerDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let alert = CFAlertViewController(title: "title", message: "subtitle", textAlignment: .natural, preferredStyle: .alert) { (backgroundTapped) in
            print("Dismiss")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
