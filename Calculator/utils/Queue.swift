//
//  Queue.swift
//  Calculator
//
//  Created by Travis Hafner on 4/18/18.
//

import Foundation

class Queue<T> {
	private class Item<T> {
		let value: T
		var next: Item<T>?
		
		init(_ v: T) {
			value = v
		}
	}
	
	private var head: Item<T>?
	private var tail: Item<T>?
	
	func push(_ v: T) {
		let item = Item(v)
		if isEmpty() {
			head = item
			tail = item
		} else {
			tail!.next = item
			tail = item
		}
	}
	
	func poll() -> T? {
		if !isEmpty() {
			let value = head!.value
			head = head!.next
			return value
		}
		return nil
	}
	
	func isEmpty() -> Bool {
		return head == nil
	}
}
