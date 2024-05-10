//
//  Squared away.swift
//  IfElse
//
//  Created by Serge Tsyba on 6.5.2024.
//

import Foundation

func squaredAway() -> Int {
	var rangeSum = 1
	var sum = 0
	
	for root in 2...1_000_000 {
		rangeSum += squares(in: root * root - 1)
		rangeSum += squares(in: root * root - 2)
		sum += rangeSum
	}
	
	return sum + 1
}

func squares(in number: Int) -> Int {
	var number = Double(number)
	var count = 0
	
	while number > 0 {
		let root = floor(sqrt(number))
		number -= root * root
		count += 1
	}
	
	return count
}
