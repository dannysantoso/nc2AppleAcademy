//
//  QuestionEntity.swift
//  NanoChallange1
//
//  Created by danny santoso on 14/03/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import Foundation


struct QuestionEntity {
    public var question: String = ""
    public var correct: String = ""
    public var a: String = ""
    public var b: String = ""
    public var c: String = ""
    public var d: String = ""
    
    init(question:String, correct:String, a:String, b:String, c:String, d:String) {
        self.question = question
        self.correct = correct
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
}

