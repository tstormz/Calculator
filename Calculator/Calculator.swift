//
//  Calculator.swift
//  Calculator
//
//  Created by Travis Hafner on 4/21/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import Foundation

class Calculator {
	private var infixExpression: String = ""
	private let postfixExpression: Queue<PostfixToken> = Queue()
	
	var result: Result
	
	init () {
		result = Result(0)
	}
	
	func eval() {
		let operandStack: Stack<Operand> = Stack()
		while !postfixExpression.isEmpty() {
			let token = postfixExpression.poll()
			if let op = token as?  Operator {
				let operandTwo = operandStack.pop()
				let operandOne = operandStack.pop()
				let result = Operand(op.reduce(operandOne!.getValue(), operandTwo!.getValue()))
				operandStack.push(result)
			} else if let operand = token as? Operand {
				operandStack.push(operand)
			} else {
				// Error
			}
		}
		self.result = Result(operandStack.pop()!.getValue())
	}
	
	func addToken(_ token: PostfixToken) {
		self.postfixExpression.push(token)
	}
}
