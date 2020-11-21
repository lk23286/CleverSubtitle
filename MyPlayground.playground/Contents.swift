import UIKit

let maxIndexOfMainQueue = 10

    //pull randomly 3 sentence - first is the question, other two are answers

    var randomNumbers = [0,0,0]

    randomNumbers[0] = Int.random(in: 0...maxIndexOfMainQueue)
    repeat {
        randomNumbers[1] = Int.random(in: 0...maxIndexOfMainQueue)
        
    } while randomNumbers[0] == randomNumbers[1]
    repeat {
        randomNumbers[2] = Int.random(in: 0...maxIndexOfMainQueue)
    } while randomNumbers[0] == randomNumbers[2] || randomNumbers[1] == randomNumbers[2]
    
    print(randomNumbers)


