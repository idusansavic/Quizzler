//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Dusan Savic on 1/18/21.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var buttonAnswer1: UIButton!
	@IBOutlet weak var buttonAnswer2: UIButton!
	@IBOutlet weak var buttonAnswer3: UIButton!
	@IBOutlet weak var questionTracker: UILabel!
	
	var quizBrain = QuizBrain() 
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		updateUI()
	}
	
	@IBAction func buttonPressed(_ sender: UIButton) {
		let userAnswer = sender.currentTitle!
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight  {
			sender.backgroundColor = UIColor.systemGreen
		} else {
			sender.backgroundColor = UIColor.systemRed
		}
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector (updateUI), userInfo: nil, repeats: false)
		
	}
	
	@objc func updateUI() {
		//Score tracker
		questionTracker.text = quizBrain.getScore()
		
		//Questions getter
		questionLabel.text = quizBrain.getQuestionText()
		
		//Change buttons choices
		let answerChoices = quizBrain.getAnswers()
		buttonAnswer1.setTitle(answerChoices[0], for: .normal)
		buttonAnswer2.setTitle(answerChoices[1], for: .normal)
		buttonAnswer3.setTitle(answerChoices[2], for: .normal)
		
		//Button color to normal
		buttonAnswer1.backgroundColor = UIColor.clear
		buttonAnswer2.backgroundColor = UIColor.clear
		buttonAnswer3.backgroundColor = UIColor.clear
		
		//Progress bar
		progressBar.progress = quizBrain.getProgress()
		
	}
	
}

