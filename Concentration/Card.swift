//
//  Card.swift
//  Concentration
//
//  Created by Alexis Chan on 9/7/20.
//  Copyright © 2020 Alexis Chan. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    func reset() {
        Card.identifierFactory = 0
        

    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

