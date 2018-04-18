//
//  Stack.swift
//  CalculatorTests
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import XCTest
@testable import Calculator

class StackTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStack() {
		let s: Stack<String> = Stack()
		XCTAssertTrue(s.isEmpty())
		XCTAssertNil(s.pop())
		s.push("🥜")
		s.push("🍿")
		s.push("⚾️")
		XCTAssertFalse(s.isEmpty())
		XCTAssertTrue(s.pop() == "⚾️")
		XCTAssertTrue(s.pop() == "🍿")
		XCTAssertTrue(s.pop() == "🥜")
		XCTAssertTrue(s.isEmpty())
    }
    
}
