//
//  Squared away.swift
//  IfElse
//
//  Created by Serge Tsyba on 6.5.2024.
//

import Foundation

func squaredAway() -> Int {
	var sum = 0
	var last = 1
	
	for base in 1..<1_000_000 {
		last += squares(in: 2 * base - 1)
		last += squares(in: 2 * base)
		last += 2
		
		sum += last
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
