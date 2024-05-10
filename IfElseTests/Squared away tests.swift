//
//  Squared away tests.swift
//  IfElseTests
//
//  Created by Serge Tsyba on 6.5.2024.
//

import XCTest

class SquaredAwayTests: XCTestCase {
	func test1() {
		let count = squares(in: 75)
		XCTAssertEqual(count, 4)
	}
	
	func test2() {
		let count = squares(in: 64)
		XCTAssertEqual(count, 1)
	}
	
	func test3() {
		let count = squares(in: 50)
		XCTAssertEqual(count, 2)
	}
	
	func test4() {
		let count = squares(in: 1022)
		XCTAssertEqual(count, 6)
	}
	
	func test5() {
		let sum = squaredAway()
		XCTAssertEqual(sum, 40529)
	}
}
