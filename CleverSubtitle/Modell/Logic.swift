//
//  Logic.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 17..
//

import Foundation
import UIKit

struct Logic {
    
    let originalQueue = Data()
    var mainQueue = [ExtendedSentence(eng: "Leslie", hun: "Laca", goodAnswer: 0)]
    var maxIndexOfMainQueue = 0
    var positionOftheQuestion = 0
    var smallQueue = [ExtendedSentence(eng: "Leslie", hun: "Laca", goodAnswer: 0)]
/*
    var questionNumber = 0 // the number that is used under the practice
    var answerNumbers = [0,0,0]
    var goodAnswerNumberForLabel = 0
    var badAnswerNumberForLabel = 0
    var goodAnswerStrForLabel = "0"
    var badAnswerStrForLabel = "0"
 */
    
   
    mutating func populateMainQueue() {
        maxIndexOfMainQueue = originalQueue.sentences.count - 1
        for i in 0...maxIndexOfMainQueue {
            
            mainQueue.append(.init(eng: originalQueue.sentences[i].eng, hun: originalQueue.sentences[i].hun, goodAnswer: 0))
        }
        mainQueue.remove(at: 0)
    }
    
    mutating func fetchQuestion() -> String {
        
        //pull randomly 3 sentence - first is the question, other two are answers
        var randomNumbers = [0,0,0]

        randomNumbers[0] = Int.random(in: 0...maxIndexOfMainQueue)
        repeat {
            randomNumbers[1] = Int.random(in: 0...maxIndexOfMainQueue)
            
        } while randomNumbers[0] == randomNumbers[1]
        repeat {
            randomNumbers[2] = Int.random(in: 0...maxIndexOfMainQueue)
        } while randomNumbers[0] == randomNumbers[2] || randomNumbers[1] == randomNumbers[2]
        
        // remeber the position of the question in the main queue
        positionOftheQuestion = randomNumbers[0]
        
        // put the 3 sentences into a small queue
        for i in 0...2 {
            smallQueue[i] = mainQueue[randomNumbers[i]]
        }
        
        // give back the firts one engish part as question
        return  smallQueue[0].eng
    }
    func fetchAnswers() -> [String] {
        
 // get th small queue
 // mix them
 // give back the answers
        
  /*      let questionNumber = [3,2,1]
        let qN = questionNumber.count - 1
        var answers = ["","",""]

        for i in 0...qN {
            let index = questionNumber[i]
            answers[i] = practicingData[index].hun
   */
            let answers = ["", "", ""]
        
        return answers
    }
    
    
    // ckeck the answer
    mutating func checkAnswer(collectedAnswer: String) -> Score {
        
        print(collectedAnswer)
        
/*
        // get right answer from the small queue ( first memeber's english part
        let rightAnswer = practicingData[questionNumber].hun
 */
        // check right answer and collected anser
        // if it is right
            // increase the goodAnswer counter on the right answer in the main queue
            // if the right anser counter reached 2, remove the sentece from the main queue
            // increase the good answer indicator in the score
            // set the face picture to smile
        // if it is wrong
            // decrease the goodAnswer counter on the right answer in the main queue
            // decrease the wrong answer indicator in the score
            // set the face picture to scream
        
        // empty the drill queue
        // give back the score
/*
        // get the position of the right answer
        var goodAnswerNumberOfQuestion = practicingData[questionNumber].goodAnswer

        var faceImageForLabel = #imageLiteral(resourceName: "sad")
       
        // check the colected answer with the right answer
        if collectedAnswer == rightAnswer {
            //increase the field of goddAnswer of the good sentence
            goodAnswerNumberOfQuestion += 1
            // increase the number of the score label of good answer
            goodAnswerNumberForLabel += 1
            // transform number to string
           goodAnswerStrForLabel = String(goodAnswerNumberForLabel)
            faceImageForLabel = #imageLiteral(resourceName: "happy")
        }
        else {
            //decrease the field of goddAnswer of the good sentence
            goodAnswerNumberOfQuestion -= 1
            // decrease the number of the score label of bad answer
            badAnswerNumberForLabel += 1
            // transform number to string
            badAnswerStrForLabel = String(badAnswerNumberForLabel)
            faceImageForLabel = #imageLiteral(resourceName: "Scream")
        }
        

    
        
*/
        
        let score = Score(goodAnswer: "", badAnswer: "", faceImage: #imageLiteral(resourceName: "sad"))

        return score
    }
 
/*
    // create random number stack that creates question and answers numbers
    mutating func createQuestionAnswers() {
     
        // identify the size of the drill Stack
        let max = practicingData.count - 1
        
        // create a random number that identify the question
        questionNumber = Int.random(in: 0...max)
        
        for i in 0...max {
        repeat {
            answerNumbers[i]
            
        } while true
        }

        
        
    }
*/
}



