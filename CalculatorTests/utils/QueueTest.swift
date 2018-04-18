//
//  QueueTest.swift
//  CalculatorTests
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import XCTest
@testable import Calculator

class QueueTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQueue() {
		let q: Queue<String> = Queue()
		XCTAssertTrue(q.isEmpty())
		XCTAssertNil(q.poll())
		q.push("🥜")
		q.push("🍿")
		q.push("⚾️")
		XCTAssertFalse(q.isEmpty())
		XCTAssertTrue(q.poll() == "🥜")
		XCTAssertTrue(q.poll() == "🍿")
		XCTAssertTrue(q.poll() == "⚾️")
		XCTAssertTrue(q.isEmpty())
    }
    
}
