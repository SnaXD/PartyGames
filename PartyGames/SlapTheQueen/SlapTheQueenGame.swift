//
//  SlapTheQueenGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation

struct SlapTheQueenGame{
    let customizedSettings = StandardCustomizationShared
    var oneDeck = Deck().cards
    var usedDeck = [Card]()
    
    mutating func SetupGame(){
        if !customizedSettings.includeJoker {
            oneDeck.removeAll { card in
                card.cardType == .joker
            }
        }
        for _ in 1...customizedSettings.amountOfDecks {
            usedDeck.append(contentsOf: oneDeck)
        }
        
        usedDeck = usedDeck.shuffled()
    }
    
    
}
