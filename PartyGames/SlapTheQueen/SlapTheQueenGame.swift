//
//  SlapTheQueenGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct SlapTheQueenGame{
    let customizedSettings = StandardCustomizationShared
    var oneDeck = Deck().cards
    var usedDecks = [Card]()
    var displayed = [Card]() //Indholder kun 5 kort
    
    mutating func SetupGame(){
        if !customizedSettings.includeJoker {
            oneDeck.removeAll { card in
                card.cardType == .joker
            }
        }
        for _ in 1...customizedSettings.amountOfDecks {
            usedDecks.append(contentsOf: oneDeck)
        }
        usedDecks = usedDecks.shuffled()
        
        for _ in 0...4 {
            if let moreCards = usedDecks.first {
                displayed.append(moreCards)
                usedDecks.remove(at: 0)
            }
        }
    }
    
    
}

extension SlapTheQueenGame {
    
    var topCard: Card {
        return displayed[0]
    }
    
    
    var count: Int {
        let amount = displayed.count + usedDecks.count
        return amount
    }
    
    func position(of card: Card) -> Int {
        return displayed.firstIndex(of: card) ?? 0
    }
    
    func scale(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let scale = CGFloat(deckPosition) * 0.02
        
        return CGFloat(1 - scale)
    }
    
    func deckOffset(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let offset = deckPosition * -6
        return CGFloat(offset)
    }
    
    func zIndex(of card: Card) -> Double {
        return Double(count - position(of: card))
    }
    
    func rotation(for card: Card, offset: CGSize = .zero) -> Angle {
        return .degrees(Double(offset.width) / 20.0)
    }
    
    mutating func getNewCard(){
        if customizedSettings.infinityCards {
            usedDecks.append(displayed.first!)
            displayed.remove(at: 0)
            displayed.append(usedDecks.first!)
        } else {
            displayed.remove(at: 0)
            if let moreCards = usedDecks.first {
                displayed.append(moreCards)
                usedDecks.remove(at: 0)
            }
        }
    }
    
    mutating func getLastCard() {
        if customizedSettings.infinityCards {
            usedDecks.insert(displayed.last ?? displayed[0], at: 0)
            displayed.remove(at: displayed.count - 1)
            displayed.insert(usedDecks.last!, at: 0)
            usedDecks.remove(at: usedDecks.count - 1)
        }
    }
}



