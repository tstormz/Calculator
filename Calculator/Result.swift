//
//  Result.swift
//  Calculator
//
//  Created by Travis Hafner on 4/21/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import Foundation

class Result : Operand {
	private var result: Double = 0
	
	init() {
		super.init(0)
	}
	
	override func getValue() -> Double {
		return result
	}
}
