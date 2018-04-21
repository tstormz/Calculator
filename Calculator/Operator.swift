//
//  Operator.swift
//  Calculator
//
//  Created by Travis Hafner on 4/21/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import Foundation

class Operator : PostfixToken {
	enum Associativity {
		case left
		case right
	}
	
	enum Precedence {
		case high
		case low
	}
	
	enum Op {
		case plus
		case minus
		case multiply
		case divide
	}
	
	let op: Op
	let associativity: Associativity
	let precedence: Precedence
	let reduce: (Double, Double) -> Double
	
	init(_ op: String) {
		if (op == "+") {
			self.op = .plus
		} else if (op == "-") {
			self.op = .minus
		} else if (op == "/") {
			self.op = .divide
		} else {
			self.op = .multiply
		}
		switch self.op {
		case .plus:
			associativity = .left
			precedence = .low
			reduce = { (x: Double, y: Double) -> Double in return x + y }
		case .minus:
			associativity = .left
			precedence = .low
			reduce = { (x: Double, y: Double) -> Double in return x - y }
		case .multiply:
			associativity = .left
			precedence = .high
			reduce = { (x: Double, y: Double) -> Double in return x * y }
		case .divide:
			associativity = .left
			precedence = .high
			reduce = { (x: Double, y: Double) -> Double in return x / y }
		}
	}
}
