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
        let answer = data.sentences[0].eng
        return answer
    }
    func giveMeAnswer() -> [String] {
        
        let questionNumber = [3,2,1]
        let qN = questionNumber.count - 1
        var answers = ["","",""]
        
        for i in 0...qN {
            let index = questionNumber[i]
            answers[i] = data.sentences[index].eng
            
        }
        return answers
    }
    
}
