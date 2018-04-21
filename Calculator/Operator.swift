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
	
	let associativity: Associativity
	let precedence: Precedence
	let reduce: (Double, Double) -> Double
	
	init(associativity: Associativity, precedence: Precedence, perform reduction: @escaping (Double, Double) -> Double) {
		self.associativity = associativity
		self.precedence = precedence
		reduce = reduction
	}
}
