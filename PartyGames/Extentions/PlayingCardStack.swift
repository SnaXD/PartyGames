//
//  PlayingCardStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 20/06/2022.
//

import Foundation
import SwiftUI

protocol PlayingCardStack {
    associatedtype DataType
    var usedDecks: [Card] {get set}
    var displayed: [Card] {get set} //Indholder kun 5 kort
    var customizedSettings: DataType {get set}
}
extension PlayingCardStack {
    func topCard() -> Card {
        return displayed[0]
    }
    
    func count() -> Int
    {
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
        return Double(count() - position(of: card))
    }
    
    func rotation(for card: Card, offset: CGSize = .zero) -> Angle {
        return .degrees(Double(offset.width) / 20.0)
    }
    
    mutating func getNewCard(){
        if let settings = customizedSettings as? StandardCustomization{
            getNewCardGeneric(settings: settings)
        }
    }
    mutating func getNewCardGeneric<T: StandardCustomization>(settings: T){
        if settings.infinityCards {
            usedDecks.append(displayed.first!)
            displayed.remove(at: 0)
            displayed.append(usedDecks.first!)
            usedDecks.remove(at: 0)
        } else {
            displayed.remove(at: 0)
            if let moreCards = usedDecks.first {
                displayed.append(moreCards)
                usedDecks.remove(at: 0)
            }
        }
    }
    mutating func getLastCard(){
        if let settings = customizedSettings as? StandardCustomization{
            getLastCardGeneric(settings: settings)
        }
    }
    mutating func getLastCardGeneric<T: StandardCustomization>(settings: T){
        if settings.infinityCards {
            usedDecks.insert(displayed.last ?? displayed[0], at: 0)
            displayed.remove(at: displayed.count - 1)
            displayed.insert(usedDecks.last!, at: 0)
            usedDecks.remove(at: usedDecks.count - 1)
        }
    }
}

