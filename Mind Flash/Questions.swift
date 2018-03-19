//
//  Questions.swift
//  Mind Flash
//
//  Created by Bersabeh Asefa on 3/19/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import Foundation

class Question {
    
    var question: String
    var opitinA: String
    var opitinB: String
    var opitinC: String
    var opitinD: String
    
    init(question:String, choicA:String, choicB:String, choicC:String, choicD:String) {
        self.question  = question
        self.opitinA = choicA
        self.opitinB = choicB
        self.opitinC = choicC
        self.opitinD = choicD
    
    
    }
    
}











