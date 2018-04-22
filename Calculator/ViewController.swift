//
//  ViewController.swift
//  Calculator
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	private var buffer: String = ""
	
	var calculator = Calculator()
	@IBOutlet weak var result: UILabel!
	
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
	
	@IBAction func addPlus(_ sender: UIButton) {
		calculator.addToken(createOperand())
		calculator.addToken(Operator("+"))
	}
	
	@IBAction func addMinus(_ sender: UIButton) {
		calculator.addToken(createOperand())
		calculator.addToken(Operator("-"))
	}
	
	@IBAction func addMultiply(_ sender: UIButton) {
		calculator.addToken(createOperand())
		calculator.addToken(Operator("*"))
	}
	
	@IBAction func addDivide(_ sender: UIButton) {
		calculator.addToken(createOperand())
		calculator.addToken(Operator("/"))
	}
	@IBAction func calculate(_ sender: UIButton) {
		// Add the last input number
		calculator.addToken(createOperand())
		// Flush any operators not pushed to the queue
		calculator.flushOperatorStack()
		// Evaluate the current expression
		calculator.eval()
		// Print the output
		result.text = String(format: "%.8f", calculator.result.getValue())
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
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
		buffer += i
		result.text = buffer
	}
}

