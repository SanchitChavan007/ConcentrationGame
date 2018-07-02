//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Sanchit Chavan on 7/1/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numOfPair:(cardButtons.count + 1)/2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipCount = 0{
        didSet{
             flipLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1;
        if let cardNumber = cardButtons.index(of: sender){
         game.chooseCard(at: cardNumber)
            updateViewFromModel()
    }
        else{
            print("NO Card")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
                else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    

    var emojiChoices = ["👻","🎃","😈","☠️","😿","👾","💩","👼🏻","👨🏽‍🚀","🕴🏼"]

    var emoji = [Int:String]()
    
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0{
                
            
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
     return emoji[card.identifier] ?? "?"
    }
    
}

