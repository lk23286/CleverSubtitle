//
//  Logic.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 17..
//

import Foundation


struct Logic {
    
    let data = Data()
    var practicingData = [ExtendSentence(eng: "Leslie", hun: "Laca", goodAnswer: 0)]
    var questionNumber = 0
    var goodAnswer = 0
    var badAnswer = 0
    
   
    mutating func createPracticingData() {
        let max = data.sentences.count - 1
        for i in 0...max {
            
            practicingData.append(.init(eng: data.sentences[i].eng, hun: data.sentences[i].hun, goodAnswer: 0))
        }

    }
    
    mutating func giveMeQuestion() -> String {
    
        // get three from the stack randomly where goodAnswer < 2
        // put the three into a small stack
            // mark the good answer
        
        let max = practicingData.count - 1
        questionNumber = Int.random(in: 0...max)
        
        let answer = practicingData[questionNumber].eng
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
            answers[i] = practicingData[index].hun
            
        }
        return answers
    }
    
    
    // ckeck the answer
    mutating func checkAnswer(collectedAnswer: String) -> Score {
        
        
        
        
        let score = Score(goodAnswer: "6", badAnswer: "8", faceImage: #imageLiteral(resourceName: "Scream"))
        
        print(collectedAnswer)
        let rightAnswer = practicingData[questionNumber].hun
        var goodAnswerNumber = practicingData[questionNumber].goodAnswer
       
        if collectedAnswer == rightAnswer {
            goodAnswerNumber += 1
            goodAnswer += 1
        }
        else {
            goodAnswerNumber -= 1
            badAnswer += 1
           // let badAnswerStr = String
        }
        
        
        // if answer is good then add +1 of goodAnswer of the answer in stack 
        
        
        return score
        
    }
        //
}



