//
//  Champernowne's word.swift
//  IfElse
//	https://docs.google.com/document/d/1jTlXkryFioVkadtM3O9naJGEP9B-Q67pX58_bxxBp-0/
//
//  Created by Serge Tsyba on 26.4.2024.
//

import Foundation

func champernowneWord() -> Int {
	let word = ChampernowneWord()
	var indexes = (1...4)
		.flatMap({ word.nthIndexes(digitCount: $0) })
	
	let index = word.nthIndex(of: 10000)
	indexes.append(index)
	
	return indexes.reduce(0, +)
}

struct ChampernowneWord {
	func nthIndex(of number: Int) -> Int {
		var numbers = NumberIterator(digitCount: number.digits.count)
		var index = 0
		
		for _ in 0..<number {
			while let next = numbers.next() {
				index += 1
				if next == number {
					break
				}
			}
		}
		
		return index
	}
	
	func nthIndexSum(upTo number: Int) -> Int {
		return (1...number)
			.map({ self.nthIndex(of: $0) })
			.reduce(0, +)
	}
	
	func nthIndexes(digitCount: Int) -> [Int] {
		let min = pow10(digitCount - 1)
		let max = pow10(digitCount)
		
		var indexes: [(Int, Int)] = Array(repeating: (0, 0), count: max + 1)
		let numbers = NumberIterator(digitCount: digitCount)
		
		var found = 0
		for (index, number) in numbers.enumerated() {
			guard found < (max - min) else {
				break
			}
			guard min <= number else {
				continue
			}
			
			var (count, _) = indexes[number]
			if count < number {
				count += 1
				
				if count == number {
					indexes[number] = (count, index + 1)
					found += 1
				} else {
					indexes[number] = (count, 0)
				}
			}
		}
		
		return indexes
			.dropFirst(min)
			.dropLast(1)
			.map({ $0.1 })
	}
}

extension ChampernowneWord {
	struct NumberIterator: IteratorProtocol, Sequence {
		private var number: Int
		private var digits: any IteratorProtocol<Int>
		private let exp: Int
		
		init(digitCount count: Int = 1) {
			self.number = Int(digits: 0..<count)
			self.digits = DigitIterator(number: count)
			self.exp = pow10(count - 1)
		}
		
		mutating func next() -> Int? {
			self.number %= self.exp
			self.number *= 10
			self.number += self.digits.next()!
			
			return self.number
		}
	}
	
	struct DigitIterator: IteratorProtocol {
		private var number: Int
		private var digits: any IteratorProtocol<Int>
		
		init(number: Int = 1) {
			self.number = number
			self.digits = number.digits
				.makeIterator()
		}
		
		mutating func next() -> Int? {
			if let next = self.digits.next() {
				return next
			} else {
				self.number += 1
				self.digits = self.number.digits
					.makeIterator()
				
				return self.digits.next()
			}
		}
	}
}

extension Int {
	init(digits: any Sequence<Int>) {
		self = digits.reduce(0, { $0 * 10 + $1 })
	}
	
	var digits: [Int] {
		var number = self
		var digits: [Int] = []
		
		repeat {
			digits.append(number % 10)
			number /= 10
		} while number > 0
		
		return digits.reversed()
	}
}

private func pow10(_ n: Int) -> Int {
	return Int(pow(10.0, Double(n)))
}
