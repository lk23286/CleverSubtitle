//
//  brain.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 11..
//

import Foundation

struct Brain {
    

var sentences = [
    Sentence(eng: "Hello",
             hun: "Szia",
             goodAnswer: 0,
             wrongAnswer: 0),
    Sentence(eng: "Be brave",
             hun: "Légy bátor",
             goodAnswer: 0,
             wrongAnswer: 0),
    Sentence(eng: "Have the courage to follow your heart and intuition.",
             hun: "Legyen bátorságod követni a szíved és a megérzésed.",
             goodAnswer: 0,
             wrongAnswer: 0),
    Sentence(eng: "They somehow know what you truly want to become",
             hun: "Ezek valahogy tudják mi az amivé igazán válni akarsz.",
             goodAnswer: 0,
             wrongAnswer: 0),
    Sentence(eng: "Good Morning!", hun: "Jó reggelt!",
             goodAnswer: 0,
             wrongAnswer: 0),
    Sentence(eng: "Stay Hungry Stay Foolish",
             hun: "Maradj Éhes Maradj Bolond",
             goodAnswer: 0,
             wrongAnswer: 0)
]

var maxIndexOfSentences = 0
var rightAnswer = 0
let numberOfAnswer = 3
var displayGoodAnswe = 0
var displayWrongAnswe = 0

    // Answer BEGIN
    func answer(answerArray: [Sentence]) -> (good:String, wrong:String) {
        let index = answerArray.count - 1
        var goodAnswerNumber = 0
        var wrongAnswerNumber = 0
        
        for i in 0...index {
            goodAnswerNumber += answerArray[i].goodAnswer
            wrongAnswerNumber += answerArray[i].wrongAnswer
        }
        
        return ("\(goodAnswerNumber)", "\(wrongAnswerNumber)" )
    }
    // Answer END
     
     // createRandomNumberArray BEGIN
     func creatRandomNumbersArray (numberOfRandomNumbers: Int, range: Int) -> [Int] {
         var randomNumbers = [Int](repeating: 0, count: numberOfRandomNumbers+1)
         let randomNumbersIndex = randomNumbers.count-1
         var randomNumber = 0
         randomNumbers[0] = Int.random(in: 0...range)
         
        
         
         func createRandomNumber( _ range: Int) {
             randomNumber = Int.random(in: 0...range)
         }
         
         func noUniqueNumber() -> Bool {
             for j in 1...randomNumbersIndex {
                 if randomNumber == randomNumbers[j] || randomNumber == randomNumbers[0]  {
                     return true
                 }
             }
             return false
         }
         
         func putNumberRandomlyIntoArray(number:Int, array:[Int]) -> [Int] {
             var internalArray = array
             let arrayIndex = array.count - 1
             let internalRandomNumber = Int.random(in: 1...arrayIndex)
             internalArray[internalRandomNumber] = number
             return internalArray
         }
         for i in 1...randomNumbersIndex {
             repeat {
                 createRandomNumber(range)
             } while noUniqueNumber()
             randomNumbers[i] = randomNumber
         }
         
         func sentenceArrayModifyer (array: [Sentence]) -> [Sentence] {
             var internalArray = array
             let internalArrayIndex = internalArray.count - 1
             var removableIndex = 0
             
             for i in 0...internalArrayIndex {
                 if internalArray[i].goodAnswer == 2 {
                     removableIndex = i
                 }
             }
             internalArray.remove(at: removableIndex)
            // internalArrayIndex = internalArray.count - 1
             
             return internalArray
         }
         
         
         // sentences = sentenceArrayModifyer(array: sentences)
         
         
         return putNumberRandomlyIntoArray(number: randomNumbers[0], array: randomNumbers)
     }

     // createRandomNumberArray END
     

    
    
}

