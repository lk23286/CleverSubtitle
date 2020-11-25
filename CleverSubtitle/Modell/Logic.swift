//
//  Logic.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 17..
//

import Foundation
import UIKit
import AVFoundation

struct Logic {
    
    let originalQueue = Data()
    var mainQueue = [ExtendedSentence(eng: "Leslie", hun: "Laca", goodAnswer: 0)]
    var maxIndexOfMainQueue = 0
    var positionOftheQuestion = 0
    var smallQueue = [ExtendedSentence(eng: "Leslie1", hun: "Laca1", goodAnswer: 0),
                      ExtendedSentence(eng: "Leslie2", hun: "Laca2", goodAnswer: 1),
                      ExtendedSentence(eng: "Leslie3", hun: "Laca3", goodAnswer: 2)]
    var scoreGoodAnswerIndicator = 0
    var scoreBadAnswerIndicator = 0
    var player = AVAudioPlayer()
    
    
    
    mutating func populateMainQueue() {
        
        maxIndexOfMainQueue = originalQueue.sentences.count - 1
        
        
        for i in 0...maxIndexOfMainQueue {
            
            mainQueue.append(.init(eng: originalQueue.sentences[i].eng, hun: originalQueue.sentences[i].hun, goodAnswer: 0))
        }
        mainQueue.remove(at: 0)
    }
    
    mutating func resetAll() {
        playSound("magicWand")
        
        scoreBadAnswerIndicator = 0
        scoreGoodAnswerIndicator = 0
        smallQueue.removeAll()
        smallQueue = [ExtendedSentence(eng: "Leslie1", hun: "Laca1", goodAnswer: 0),
                      ExtendedSentence(eng: "Leslie2", hun: "Laca2", goodAnswer: 1),
                      ExtendedSentence(eng: "Leslie3", hun: "Laca3", goodAnswer: 2)]
        mainQueue.removeAll()
        mainQueue = [ExtendedSentence(eng: "Leslie", hun: "Laca", goodAnswer: 0)]
        
        populateMainQueue()
    }
    
    mutating func fetchQuestion() -> String {
        
        // repeate this one until the first one not empty  and second or third is not empty
        repeat {
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
        // repeate unit there is no question but there is at least one answer
        } while smallQueue[0].eng == "" && (smallQueue[1].eng != "" || smallQueue[2].eng != "")
        
        // check here whether the question is empty, if yes go back to the beginig and generate again
//        if smallQueue[0].eng == "" && smallQueue[1].eng == "" && smallQueue[2].eng == ""  {
//        resetAll()
//        }
        // give back the firts one engish part as question
        return  smallQueue[0].eng
    }
    
    mutating func fetchAnswers() -> [String] {
        
        var answers = ["","",""]
        
        // mix them small queue
        let a = smallQueue[0]
        let b = smallQueue[1]
        let c = smallQueue[2]
        var randomNumber = Int.random(in: 0...2)
        smallQueue[randomNumber] = a
        switch randomNumber {
        case 0: // a is at position 0
            randomNumber = Int.random(in: 0...1)
            if randomNumber == 1 {
                smallQueue[1] = c
                smallQueue[2] = b
            }
        case 1: // a is at position 1
            randomNumber = Int.random(in: 0...1)
            if randomNumber == 1 {
                smallQueue[0] = b
            } else {
                smallQueue[0] = c
                smallQueue[2] = b
            }
        default : // a is at position 2
            randomNumber = Int.random(in: 0...1)
            if randomNumber == 1 {
                smallQueue[0] = c
            } else {
                smallQueue[0] = b
                smallQueue[1] = c
            }
        }
        
        
        // update the size of the mainQueue
        // maxIndexOfMainQueue = mainQueue.count
        //  print(maxIndexOfMainQueue)
        
        // give back the answers
        for i in 0...2 {
            answers[i] = smallQueue[i].hun
        }
        
        return answers
    }
    
    
    // ckeck the answer
    mutating func checkAnswer(collectedAnswer: String) -> Score {
        
        let answerIndex = positionOftheQuestion
        let rightAnswer = mainQueue[answerIndex].hun
        var scoreFaceImage = #imageLiteral(resourceName: "sad")
        var sound = "A"
        
        // if right answer is not empty calculate score otherwise give back scoreFace
        if rightAnswer != "" {
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
            
            if rightAnswer == collectedAnswer {
                // good answer branch
                
                // play sound if there is only 3 sentence
                // 0 empty sentece B
                // 1 empty sentece C
                // 2 empty sentece D
                print(mainQueue.count)
                if mainQueue.count == 3 {
                    var numberOfEmptySentence = 0
                    for i in 0...2 {
                        if mainQueue[i].hun == "" {
                            numberOfEmptySentence += 1
                        }
                    }
                    switch numberOfEmptySentence {
                    case 0:
                        sound = "B"
                    case 1:
                        sound = "C"
                    default:
                        sound = "D"
                    }
                }
                print("sound: \(sound)")
                
                
                mainQueue[answerIndex].goodAnswer += 1 // increase goodAnswer number at question in mainQueue
                
                if mainQueue[answerIndex].goodAnswer == 2  {
                    mainQueue.remove(at: answerIndex) // remove the question because it is learned
                    maxIndexOfMainQueue -= 1
                }
                
                scoreGoodAnswerIndicator += 1 // update good answer score
                scoreFaceImage =  #imageLiteral(resourceName: "happy")
            } else {
                // bad answer branch
                sound = "hiccup"
                // mainQueue[answerIndex].goodAnswer -= 1 // decrease goodAnswer number at question in mainQueue
                scoreBadAnswerIndicator += 1 // update bad answer score
                scoreFaceImage =  #imageLiteral(resourceName: "Scream")
            }
            
            // check if there are only 2 memebers of the main queue
            if mainQueue.count == 2 {
                
                // there is still one or null question
                if mainQueue[0].hun == "" || mainQueue[1].hun == "" {
                    // if one of the two memebers are not empty add an empty member
                    mainQueue.append(.init(eng: "", hun: "", goodAnswer: 0))
                    maxIndexOfMainQueue += 1
                    
                // there are still two question
                } else {
                    mainQueue.append(.init(eng: "", hun: "", goodAnswer: 0))
                    maxIndexOfMainQueue += 1
                }
                
            }
            
        } else {
            // right answer is empty Branch
            // no more question End of the Drill
            // give back the "smile" Face
            scoreFaceImage = #imageLiteral(resourceName: "smile")
            sound = "hiccup"
            
            
        }
        
        // give back the score
        
        let score = Score(goodAnswer: String(scoreGoodAnswerIndicator), badAnswer: String(scoreBadAnswerIndicator), faceImage: scoreFaceImage)
        playSound(sound)
        
        return score
    }
    
    mutating func playSound (_ sound: String) {
        let url = Bundle.main.url(forResource: sound , withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}



