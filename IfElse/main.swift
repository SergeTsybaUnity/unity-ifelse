//
//  main.swift
//  IfElse
//
//  Created by Serge Tsyba on 26.4.2024.
//

if CommandLine.arguments.contains("champernowne") {
	let word = ChampernowneWord()
	var indexes = (1...4)
		.flatMap({ word.nthIndexes(digitCount: $0) })
	
	let index = word.nthIndex(of: 10000)
	indexes.append(index)
	
	for index in indexes.enumerated() {
		print("\(index.0 + 1)\t\(index.1)")
	}
} else {
	print("usage: ifelse [champernowne]")
}
