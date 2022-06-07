//
//  Deck.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct Deck {
    
    var topCardOffset: CGSize = .zero
    var activeCard: Card? = nil
    
    var cards = [
        Card(question: "The tallest building in the world is located in which city?", color: .purple),
        Card(question: "Which year was the original Toy Story film released?", color: .red),
        Card(question: "Which film was the first to be recognised as part of the Marvel Cinematic Universe?", color: .green),
        Card(question: "Name the longest river in the UK.", color: .blue),
        Card(question: "In which year was the popular video game Fortnite first released?", color: .orange)
    ]
    
    var topCard: Card {
        return cards[0]
    }
    
    var count: Int {
        return cards.count
    }
    
    func position(of card: Card) -> Int {
        return cards.firstIndex(of: card) ?? 0
    }
    
    func scale(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let scale = CGFloat(deckPosition) * 0.02
        return CGFloat(1 - scale)
    }
    
    func deckOffset(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let offset = deckPosition * -10
        return CGFloat(offset)
    }
    
    func zIndex(of card: Card) -> Double {
        return Double(count - position(of: card))
    }
    
    func rotation(for card: Card, offset: CGSize = .zero) -> Angle {
        return .degrees(Double(offset.width) / 20.0)
    }
    
    mutating func moveToBack(_ state: Card) {
        let topCard = cards.remove(at: position(of: state))
        cards.append(topCard)
    }
    
    mutating func moveToFront(_ state: Card) {
        let topCard = cards.remove(at: position(of: state))
        cards.insert(topCard, at: 0)
    }
}
