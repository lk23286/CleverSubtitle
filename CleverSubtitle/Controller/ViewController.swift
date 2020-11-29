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
    var drillInProgress = true
    var timer = Timer()
    var alphaOne = true // needs to the update timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        drillInProgress =  tryNewDrill()
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
        //If it is not succefull no more question:
        // background is alpha 0.5
        // alpha 0.5 - 1 is blinking until FaceButton is pressed
        if  tryNewDrill() == false {
            timer.invalidate()
            
            FaceButtonLabel.setImage(score.faceImage, for: .normal)
          
         // timer makes the face image blinking
            timer = Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        }
    }
        
    @objc func updateTimer() {
        if alphaOne {
            alphaOne = false
            self.FaceButtonLabel.alpha = 1
            
        } else {
            alphaOne = true
            self.FaceButtonLabel.alpha = 0.5
            
        }
        
    }
    
    @IBAction func FaceButton(_ sender: UIButton) {
        // FaceButton can be pressed only if the drill is ended ( answer == "")
        
        let question = logic.fetchQuestion()
        if question == "" {
            reset()
            drillInProgress = tryNewDrill()
        }
        
    }
    
    func tryNewDrill() -> Bool {
        var successful = true
        
        // giveMeQuestion -> question
        let question = logic.fetchQuestion()
        
        // question is empty means the drill is ended
        if question == "" {
            successful = false
        }
        // showQuestion (question)
        questionLabel.text = question
        
        // giveMeAnswers -> answers
        let answers = logic.fetchAnswers()
        
        // showAnswers (answers)
        Answer1ButtonLabel.setTitle(answers[0], for: .normal)
        Answer2ButtonLabel.setTitle(answers[1], for: .normal)
        Answer3ButtonLabel.setTitle(answers[2], for: .normal)
        
        return successful
    }
    
    func reset() {
        // inicislize the  view
        timer.invalidate()
        self.FaceButtonLabel.alpha = 1
        
        FaceButtonLabel.setImage(faceImage, for: .normal)
        GoodAnswerLabel.text = goodNumber
        BadAnswerLabel.text = badNumber
        
        logic.resetAll()
        
        
    }
    
    
}

