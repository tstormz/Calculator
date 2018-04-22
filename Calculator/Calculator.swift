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
	private let operandStack: Stack<Operand> = Stack()
	private let operatorStack: Stack<Operator> = Stack()
	
	var result: Result
	
	init () {
		result = Result(0)
	}

	func eval() {
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
		if let op = token as? Operator {
			var opsNeedToBePushed = !operatorStack.isEmpty()
			print("starting loop")
			while opsNeedToBePushed {
				let nextOp = operatorStack.peek()
				if let precedence = nextOp?.precedence {
					print("top: \(nextOp!.op) [\(nextOp!.precedence)]")
					if precedence > op.precedence {
						postfixExpression.push(operatorStack.pop()!)
					} else if precedence == op.precedence && nextOp!.associativity == .left {
						postfixExpression.push(operatorStack.pop()!)
					}
				} else {
					opsNeedToBePushed = false
				}
			}
			operatorStack.push(op)
		} else if let number = token as? Operand {
			self.postfixExpression.push(number)
		} else if let number = token as? Result {
			self.postfixExpression.push(number)
		}
	}
	
	func flushOperatorStack() {
		while !operatorStack.isEmpty() {
			postfixExpression.push(operatorStack.pop()!)
		}
	}
}
