//
//  Squared away tests.swift
//  IfElseTests
//
//  Created by Serge Tsyba on 6.5.2024.
//

import XCTest

class SquaredAwayTests: XCTestCase {
	func test1() {
		let count = 75.squares.count
		XCTAssertEqual(count, 4)
	}
	
	func test2() {
		let count = 64.squares.count
		XCTAssertEqual(count, 1)
	}
	
	func test3() {
		let count = 50.squares.count
		XCTAssertEqual(count, 2)
	}
	
	func test4() {
		let count = 1022.squares.count
		XCTAssertEqual(count, 6)
	}
	
	func test5() {
		let sum = (1...10000)
			.map({ $0.squares.count })
			.reduce(0, +)
		
		XCTAssertEqual(sum, 40529)
	}
	
	func test6() {
		let sum = (1...1000_000_000_000)
			.map({ $0.squares.count })
			.reduce(0, +)
		
		XCTAssertEqual(sum, 40529)
	}
}
