//
//  Logic.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 17..
//

import Foundation


struct Logic {
    
    let data = Data()
    
    
    func giveMeQuestion() -> String {
        // get three from the stack randomly where goodAnswer < 2
        // put the three into a small stack
            // mark the good answer
        
        let max = data.sentences.count - 1
        let getOne = Int.random(in: 0...max)
        
        let answer = data.sentences[getOne].eng
        return answer
    }
    func giveMeAnswer() -> [String] {
        // get the three from the small stack
        
        // give out the answers
        let questionNumber = [3,2,1]
        let qN = questionNumber.count - 1
        var answers = ["","",""]
        
        for i in 0...qN {
            let index = questionNumber[i]
            answers[i] = data.sentences[index].hun
            
        }
        return answers
    }
    
    
    // ckeck the answer
    func checkAnswer(answer: String) -> Score {
        let score = Score(goodAnswer: "6", badAnswer: "8", faceImage: #imageLiteral(resourceName: "sad"))
        
        // if answer is good then add +1 of goodAnswer of the answer in stack 
        
        
        return score
        
    }
        //
    
    
}
