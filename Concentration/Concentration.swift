//
//  Concentration.swift
//  Concentration
//
//  Created by Alexis Chan on 9/7/20.
//  Copyright © 2020 Alexis Chan. All rights reserved.
//

import Foundation
class Concentration {
    var cards = [Card]()
    
    var Matching = 0
// H) Change the location of the flipCount from class to where it should be in aproperly implemented MVC architecture.
    var flipCount = 1
    

    var indexOfOneAndOnlyFaceUpCard: Int?
    //reset function will rest flipcount, matching, faceup and matched
    func reset() {
        flipCount = 0
        Matching = 0
        cards.removeAll()
        for index in 0..<cards.count{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
            
            
        }
        //cards = [Card]()
        
        
        
    }
    func chooseCard(at index: Int) {

        flipCount += 1
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,
                //checks if cards match
                matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    Matching += 1
                    
                }else{
                    Matching -= 1
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
                
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }
        
    }
    init(numberOfPairsOfCards: Int) {
       
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            cards += [card, card]
            //D) Shuffle the cards in the init method of the model.
            cards.shuffle()
            

            
        }
        
    }
    
    //TODO: Shuffle cards
}
