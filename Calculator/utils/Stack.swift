//
//  Stack.swift
//  Calculator
//
//  Created by Travis Hafner on 4/18/18.
//

import Foundation

class Stack<T> {
	private class Item<T> {
		let value: T
		var next: Item<T>?
		
		init (_ v: T) {
			value = v
		}
	}
	
	private var head: Item<T>?
	
	func push(_ value: T) {
		if isEmpty() {
			head = Item(value)
		} else {
			let temp = head
			head = Item(value)
			head!.next = temp
		}
	}
	
	func pop() -> T? {
		if isEmpty() {
			return nil
		} else {
			let temp = head
			head = head!.next
			return temp!.value
		}
	}
	
	func peek() -> T? {
		if isEmpty() {
			return nil
		} else {
			return head!.value
		}
	}
	
	func isEmpty() -> Bool {
		return head == nil
	}
}
