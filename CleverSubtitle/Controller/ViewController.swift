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
    
    let logic = Logic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let goodNumber = "0"
        let badNumber = "0"
        let faceImage = #imageLiteral(resourceName: "sad")
        
        FaceButtonLabel.setImage(faceImage, for: .normal)
    
        GoodAnswerLabel.text = goodNumber
         
        BadAnswerLabel.text = badNumber
        
        // giveMeQuestion -> question
        let question = logic.giveMeQuestion()
        
       // showQuestion (question)
        questionLabel.text = question
        
       // giveMeAnswers -> answers
        let answers = logic.giveMeAnswer()
        
       // showAnswers (answers)
        Answer1ButtonLabel.setTitle(answers[0], for: .normal)
        Answer2ButtonLabel.setTitle(answers[1], for: .normal)
        Answer3ButtonLabel.setTitle(answers[2], for: .normal)
        
        
    }

    @IBAction func Answer1Button(_ sender: UIButton) {
        
        let answer = sender.currentTitle
        print(answer!)
     // checkAnswer (answer) -> score
    // viewResult (score)
        // giveMeQuestion -> question
       // showQuestion (question)
       // giveMeAnswers -> answers
       // showAnswers (answers)
        
        
        
    }
    
    @IBAction func Answer2Button(_ sender: UIButton) {
       // checkAnswer
    }
    
    @IBAction func Answer3Button(_ sender: UIButton) {
        // checkAnswer
    }
    
    @IBAction func FaceButton(_ sender: UIButton) {
        // reset
    }
}

