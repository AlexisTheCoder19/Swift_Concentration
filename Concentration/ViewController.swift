//
//  ViewController.swift
//  Concentration
//
//  Created by Alexis Chan on 8/31/20.
//  Copyright © 2020 Alexis Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var emoji = [Int:String]()
    var numOfGames = 0
    

    //E) Provide 5 different themes of Emojis.
    //Array that will store the themes, The themes are Faces, Animals, sea Animals, fruit, and transportaion
    let Theme = [
        ["😂","🤔","😃","😱","😁","😆","😍","😛", "🧐", "🥳", "😤","🥶","😧"],
        ["🐶", "🐰", "🐝","🐢", "🦅","🦎","🦉","🐺", "🐴", "🦁", "🐯","🐮","🐱"],
        ["🦀", "🐬","🦞","🐟", "🐙","🐡","🐠","🐋", "🐳", "🦈", "🐊","🐢","🌊"],
        ["🍏", "🍎", "🍐","🍊", "🍋","🍌","🍉","🍇", "🍓", "🍈", "🍒","🥭","🍑"],
        ["🚗", "🚕", "🚙","🚌", "🚎","🏎","🚓","🚑", "🚒", "🚐", "🚚","🚛","🚔"],
    ]


    var flipCount = 0{
        //to change label
        didSet{
            flipCountlabel.text = "Flips: \(game.flipCount)"
        }
    }
    var countScore = 0 {
        didSet{
            //ScoreLabel.text = "Score \(countScore)"
            ScoreLabel.text = "Score: \(game.Matching)"
            
        }
    }

    
    @IBOutlet var cardButtons: [UIButton]!

    
    
   
    
    //UILabels
    @IBOutlet weak var flipCountlabel: UILabel!
    //G) AddagamescorelabelintheUIthatgivesapointforeverymatchanddeducts one for every mismatch.
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    //setTheme will generate a random theme to be displayed in game
    func setTheme(){
        let randomPick = Int.random(in: 0..<5)
        emojiChoices = Theme[randomPick]
    }
    
    //C) Create a new game button that starts the game and re-starts back to the beginning if one is in progress.
    
    //this function will let users restart the game when the press the restart button
    @IBAction func newGameButton(_ sender: UIButton) {

        game.reset()
        flipCountlabel.text = "Flips: \(game.flipCount)"
        ScoreLabel.text = "Score: \(game.Matching)"
        emoji.removeAll()
        game = Concentration(numberOfPairsOfCards:  (cardButtons.count + 1) / 2)
        //F) Make it possible to add a new theme with one line of code.
        setTheme()
        updateViewFromModel()

       
        
        
    }


    //touchCard executes everythime user clicks
    @IBAction func touchCard(_ sender: UIButton) {
        
        //flipCount += 1
        flipCount = game.flipCount
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("Chosen card not in button")
        }
        //flipCard(withEmoji: "🤔", on: sender)
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                countScore = game.Matching
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0): #colorLiteral(red: 0, green: 0.4280731999, blue: 0.7568627596, alpha: 1)
            }
        }

    }
    //Todo add commneted text to code
    //default value of game
    var emojiChoices = ["🐿","🚴‍♂️","🧑‍💻","☀️", "🐶", "🦋", "🐬","🦞","🐠","🐸","🎒", "🥶", "😂"]
    //var emoji = [Int:String]()
    
    
    
    private func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            //random
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }
    

    

}
