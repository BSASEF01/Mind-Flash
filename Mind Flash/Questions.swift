//
//  Questions.swift
//  Mind Flash
//
//  Created by Bersabeh Asefa on 3/19/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import Foundation

class Question {
    
    var questionText: String
    var answer: [String]
    var correctanswer: Int
    
    init(questionText:String, answer:[String], correctanswer:Int) {
        self.questionText  = questionText
        self.answer = answer
        self.correctanswer = correctanswer
        
        
    
    }
    
}











