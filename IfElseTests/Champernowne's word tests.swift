//
//  Champernowne's word tests.swift
//  IfElseTests
//
//  Created by Serge Tsyba on 26.4.2024.
//

import XCTest

class ChampernowneWordNthIndexTests: XCTestCase {
	private let word = ChampernowneWord()
	
	func test1() {
		let index = self.word.nthIndex(of: 1)
		XCTAssertEqual(index, 1)
	}
	
	func test2() {
		let index = self.word.nthIndex(of: 5)
		XCTAssertEqual(index, 81)
	}
	
	func test3() {
		let sum = self.word.nthIndexSum(upTo: 5)
		XCTAssertEqual(sum, 193)
	}
}

class IntDigitsTests: XCTestCase {
	func test1() {
		let digits = 8474726262.digits
		XCTAssertEqual(digits, [8, 4, 7, 4, 7, 2, 6, 2, 6, 2])
	}
	
	func test2() {
		let digits = 0.digits
		XCTAssertEqual(digits, [0])
	}
}
