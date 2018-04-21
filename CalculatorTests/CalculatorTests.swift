//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	// infix: 3 + 4
	// postfix: 3 4 +
    func testEvalSimple() {
        let three = Operand(3)
		let four = Operand(4)
		let plus = Operator("+")
		let c = Calculator()
		c.addToken(three)
		c.addToken(four)
		c.addToken(plus)
		c.eval()
		XCTAssert(c.result.getValue() == 7.0)
    }
	
	// infix: ((15 / (7 - (1 + 1))) * 3) - (2 + (1 + 1))
	// postfix: 15 7 1 1 + - / 3 * 2 1 1 + + -
	func testEvalComplex() {
		let fifteen = Operand(15)
		let seven = Operand(7)
		let one = Operand(1)
		let three = Operand(3)
		let two = Operand(2)
		let plus = Operator("+")
		let minus = Operator("-")
		let multiply = Operator("*")
		let divide = Operator("/")
		let c = Calculator()
		c.addToken(fifteen)
		c.addToken(seven)
		c.addToken(one)
		c.addToken(one)
		c.addToken(plus)
		c.addToken(minus)
		c.addToken(divide)
		c.addToken(three)
		c.addToken(multiply)
		c.addToken(two)
		c.addToken(one)
		c.addToken(one)
		c.addToken(plus)
		c.addToken(plus)
		c.addToken(minus)
		c.eval()
		XCTAssert(c.result.getValue() == 5.0)
	}
    
}
