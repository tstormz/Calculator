//
//  Calculator.swift
//  Calculator
//
//  Created by Travis Hafner on 4/21/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import Foundation

class Calculator {
	var result: Result = Result()
	let postfixExpression: Queue<PostfixToken> = Queue()
	let operandStack: Stack<Operand> = Stack()
	
}
