//
//  ViewController.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 07..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var Answer1ButtonLabel: UIButton!
    @IBOutlet weak var Answer2ButtonLabel: UIButton!
    @IBOutlet weak var Answer3ButtonLabel: UIButton!
    @IBOutlet weak var GoodAnswerLabel: UILabel!
    @IBOutlet weak var FaceButtonLabel: UIButton!
    @IBOutlet weak var BadAnswerLabel: UILabel!
    
    var logic = Logic()
    let goodNumber = "0"
    let badNumber = "0"
    let faceImage = #imageLiteral(resourceName: "sad")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // inicislize the  view
        FaceButtonLabel.setImage(faceImage, for: .normal)
        GoodAnswerLabel.text = goodNumber
        BadAnswerLabel.text = badNumber
        
        reset()

        
        
    }
    
    @IBAction func AnswerButtonPress(_ sender: UIButton) {
        
        let answer = sender.currentTitle
        
        
        // checkAnswer (answer) -> score
        let score = logic.checkAnswer(collectedAnswer: answer!)
        
        FaceButtonLabel.setImage(score.faceImage, for: .normal)
        GoodAnswerLabel.text = score.goodAnswer
        BadAnswerLabel.text = score.badAnswer
        
        
        // viewResult (score)
        
        
        // giveMeQuestion -> question
        // showQuestion (question)
        // giveMeAnswers -> answers
        // showAnswers (answers)
        giveOneTry()
        
    }
    

    
    @IBAction func FaceButton(_ sender: UIButton) {
        // reset
    }
    
    func giveOneTry() {
        
        // giveMeQuestion -> question
        let question = logic.fetchQuestion()
        
        // showQuestion (question)
        questionLabel.text = question
        
        // giveMeAnswers -> answers
        let answers = logic.fetchAnswers()
        
        // showAnswers (answers)
        Answer1ButtonLabel.setTitle(answers[0], for: .normal)
        Answer2ButtonLabel.setTitle(answers[1], for: .normal)
        Answer3ButtonLabel.setTitle(answers[2], for: .normal)
    }
    
    func reset() {
        logic.populateMainQueue()
        giveOneTry()
    }
        
}

