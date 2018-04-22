//
//  Operand.swift
//  Calculator
//
//  Created by Travis Hafner on 4/21/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import Foundation

class Operand : PostfixToken {
	private let value: Double
	
	init (_ value: Double) {
		self.value = value
	}
	
	func getValue() -> Double {
		return value
	}
	
	func toString() -> String {
		return String(value)
	}
}
