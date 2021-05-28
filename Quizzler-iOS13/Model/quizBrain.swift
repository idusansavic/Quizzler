//
//  quizBrain.swift
//  Quizzler-iOS13
//
//  Created by Dusan Savic on 1/18/21.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import Foundation

struct QuizBrain {
	let quiz = [
		Question(q: "Which is the largest organ in the human body?", c: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
		Question(q: "Five dollars is worth how many nickels?", c: ["25", "50", "100"], a: "100"),
		Question(q: "What do the letters in the GMT time zone stand for?", c: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
		Question(q: "What is the French word for 'hat'?", c: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
		Question(q: "In past times, what would a gentleman keep in his fob pocket?", c: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
		Question(q: "How would one say goodbye in Spanish?", c: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
		Question(q: "Which of these colours is NOT featured in the logo for Google?", c: ["Green", "Orange", "Blue"], a: "Orange"),
		Question(q: "What alcoholic drink is made from molasses?", c: ["Rum", "Whisky", "Gin"], a: "Rum"),
		Question(q: "What type of animal was Harambe?", c: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
		Question(q: "Where is Tasmania located?", c: ["Indonesia", "Australia", "Scotland"], a: "Australia")
		
		
	]
	
	var questionNumber = 0
	var userScore = 0
	
	mutating func checkAnswer(_ userAnswer: String) -> Bool {
		if userAnswer == quiz[questionNumber].answer {
			userScore += 1
			return true
		} else {
			return false
		}
	}
	
	func getScore() -> String {
		let score = ("Score: \(userScore)")
		return score
	}
	
	func getQuestionText() -> String {
		return quiz[questionNumber].text
	}
	
	
	func getProgress() -> Float {
		let progress = Float(self.questionNumber + 1) / Float(self.quiz.count)
		return progress
	}
	
	mutating func nextQuestion() {
		if questionNumber + 1 < quiz.count {
			questionNumber += 1
		} else {
			questionNumber = 0
			userScore = 0
		}
	}
	
	func getAnswers() -> [String] {
		return quiz[questionNumber].choices
	}

}
