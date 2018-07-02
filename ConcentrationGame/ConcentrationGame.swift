//
//  ConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Sanchit Chavan on 7/1/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import Foundation

class ConcentrationGame{
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    
    
    init(numOfPair:Int){
        for _ in 1...numOfPair{
                let card = Card()
            cards += [card,card]
            
        }
        func swap(i:Int,j:Int){
            
            var temp = Card()
            temp = cards[i]
            cards[i] = cards[j]
            cards[j] = temp
        
        }
        
        for c in 0..<cards.count{
            var random = Int(arc4random_uniform(UInt32(cards.count)))
            swap(i:c, j: random)
        }
        for a in cards{
        print(a.identifier)
        }
    }
    
}
