//
//  ViewController.swift
//  Calculator
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	private class ButtonState {
		static let OPERATOR = 0
		static let OPERAND = 1
		static let EQUAL = 2
		static let NONE = 3
		
		var last = NONE
		var lastOp = ""
	}
	
	private var buffer: String = ""
	private var opToButtonMap = [String: UIButton]()
	private var buttonPresses: ButtonState = ButtonState()
	
	var calculator = Calculator()
	
	// MARK: Components
	@IBOutlet weak var result: UILabel!
	@IBOutlet weak var plusButton: UIButton!
	@IBOutlet weak var minusButton: UIButton!
	@IBOutlet weak var multiplyButton: UIButton!
	@IBOutlet weak var divideButton: UIButton!
	
	// MARK: Actions
	@IBAction func clear(_ sender: UIButton) {
		calculator = Calculator()
		result.text = "0"
		buffer = ""
	}
	
	@IBAction func addZero(_ sender: UIButton) {
		addNumber("0")
	}
	
	@IBAction func addOne(_ sender: UIButton) {
		addNumber("1")
	}
	
	@IBAction func addTwo(_ sender: UIButton) {
		addNumber("2")
	}
	
	@IBAction func addThree(_ sender: UIButton) {
		addNumber("3")
	}
	
	@IBAction func addFour(_ sender: UIButton) {
		addNumber("4")
	}
	
	@IBAction func addFive(_ sender: UIButton) {
		addNumber("5")
	}
	
	@IBAction func addSix(_ sender: UIButton) {
		addNumber("6")
	}
	
	@IBAction func addSeven(_ sender: UIButton) {
		addNumber("7")
	}
	
	@IBAction func addEight(_ sender: UIButton) {
		addNumber("8")
	}
	
	@IBAction func addNine(_ sender: UIButton) {
		addNumber("9")
	}
	
	@IBAction func addDecimal(_ sender: UIButton) {
		addNumber(".")
	}
	
	@IBAction func addPlus(_ sender: UIButton) {
		addOperator("+")
	}
	
	@IBAction func addMinus(_ sender: UIButton) {
		addOperator("-")
	}
	
	@IBAction func addMultiply(_ sender: UIButton) {
		addOperator("*")
	}
	
	@IBAction func addDivide(_ sender: UIButton) {
		addOperator("/")
	}
	
	@IBAction func calculate(_ sender: UIButton) {
		// Add the last input number
		calculator.addToken(createOperand())
		// Flush any operators not pushed to the queue
		calculator.flushOperatorStack()
		// Evaluate the current expression
		calculator.eval()
		// Append the result to the result string
		result.text = formatDouble(calculator.result.getValue())
		buttonPresses.last = ButtonState.EQUAL
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Load our buttons into the map
		opToButtonMap["+"] = plusButton
		opToButtonMap["-"] = minusButton
		opToButtonMap["*"] = multiplyButton
		opToButtonMap["/"] = divideButton
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: Private Methods
	private func createOperand() -> Operand {
		let operand = Operand(Double(buffer)!)
		// Clear the buffer
		buffer = ""
		return operand
	}
	
	private func addNumber(_ i: String) {
		// If the last button pressed was a operator, turn off it's highlighting
		if buttonPresses.last == ButtonState.OPERATOR {
			clearButtonColor(op: buttonPresses.lastOp)
		}
		buffer += i
		if buttonPresses.last == ButtonState.NONE {
			result.text! = i
		} else {
			result.text! += i
		}
	}
	
	private func addOperator(_ op: String) {
		if buttonPresses.last == ButtonState.EQUAL {
			// If the last button pressed was an Equal then the user is trying
			//   to chain the result into a new expression
			calculator.pushResultOntoStack()
		} else if buttonPresses.last == ButtonState.OPERATOR {
			// If the last button pressed was another operator the user is trying
			//   to overwrite the previous operator
			clearButtonColor(op: buttonPresses.lastOp)
			calculator.undoOperator()
		}
		// Highlight the button
		if let button = opToButtonMap[op] {
			button.backgroundColor = UIColor.blue
		}
		// If there is anything in the buffer, create an operand and throw it on the stack
		if buffer != "" {
			calculator.addToken(createOperand())
		}
		// Create and throw the operator onto the stack
		calculator.addToken(Operator(op))
		// Set the last button pressed and which operator was selected
		buttonPresses.last = ButtonState.OPERATOR
		buttonPresses.lastOp = op
		result.text! += op
	}
	
	private func clearButtonColor(op: String) {
		if let button = opToButtonMap[op] {
			button.backgroundColor = UIColor.black
		}
	}
	
	private func formatDouble(_ d: Double) -> String {
		var s = String(format: "%f", d)
		if let decimal = s.index(of: ".") {
			let afterDecimal = s[decimal...]
			var allZeros = true
			for n in afterDecimal {
				print(n)
				allZeros = allZeros && n == "0" || n == "."
			}
			if allZeros {
				s = String(s[..<decimal])
			}
		}
		return s
	}
}

