//
//  ViewController.swift
//  Calculator
//
//  Created by Travis Hafner on 4/18/18.
//  Copyright © 2018 tstorm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var calculator = Calculator()
	@IBOutlet weak var result: UILabel!
	
	// MARK: Actions
	
	@IBAction func clear(_ sender: UIButton) {
		calculator = Calculator()
		result.text = "0"
	}
	
	@IBAction func addZero(_ sender: UIButton) {
		calculator.addToken(Operand(0))
		result.text = "0"
	}
	
	@IBAction func addOne(_ sender: UIButton) {
		calculator.addToken(Operand(1))
		result.text = "1"
	}
	
	@IBAction func addTwo(_ sender: UIButton) {
		calculator.addToken(Operand(2))
		result.text = "2"
	}
	
	@IBAction func addThree(_ sender: UIButton) {
		calculator.addToken(Operand(3))
		result.text = "3"
	}
	
	@IBAction func addFour(_ sender: UIButton) {
		calculator.addToken(Operand(4))
		result.text = "4"
	}
	
	@IBAction func addFive(_ sender: UIButton) {
		calculator.addToken(Operand(5))
		result.text = "5"
	}
	
	@IBAction func addSix(_ sender: UIButton) {
		calculator.addToken(Operand(6))
		result.text = "6"
	}
	
	@IBAction func addSeven(_ sender: UIButton) {
		calculator.addToken(Operand(7))
		result.text = "7"
	}
	
	@IBAction func addEight(_ sender: UIButton) {
		calculator.addToken(Operand(8))
		result.text = "8"
	}
	
	@IBAction func addNine(_ sender: UIButton) {
		calculator.addToken(Operand(9))
		result.text = "9"
	}
	
	@IBAction func addPlus(_ sender: UIButton) {
		calculator.addToken(Operator("+"))
	}
	
	@IBAction func addMinus(_ sender: UIButton) {
		calculator.addToken(Operator("-"))
	}
	
	@IBAction func addMultiply(_ sender: UIButton) {
		calculator.addToken(Operator("*"))
	}
	
	@IBAction func addDivide(_ sender: UIButton) {
		calculator.addToken(Operator("/"))
	}
	@IBAction func calculate(_ sender: UIButton) {
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


}

