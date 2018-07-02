//
//  Card.swift
//  ConcentrationGame
//
//  Created by Sanchit Chavan on 7/1/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
