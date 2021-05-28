//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dusan Savic on 1/18/21.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import Foundation


struct Question {
	let text: String
	let choices: Array<String>
	let answer: String
	
	init(q: String, c: Array<String>, a: String) {
		text = q
		choices = c
		answer = a
		
	}
}
