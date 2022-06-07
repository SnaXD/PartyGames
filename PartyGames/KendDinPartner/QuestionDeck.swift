//
//  Deck.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct QuestionDeck {
    var topCardOffset: CGSize = .zero
    var activeCard: QuestionCard? = nil
    
    var cards = [
        QuestionCard(question: "The tallest building in the world is located in which city?", color: .purple),
        QuestionCard(question: "Which year was the original Toy Story film released?", color: .red),
        QuestionCard(question: "Which film was the first to be recognised as part of the Marvel Cinematic Universe?", color: .green),
        QuestionCard(question: "Name the longest river in the UK.", color: .blue),
        QuestionCard(question: "In which year was the popular video game Fortnite first released?", color: .orange)
    ]
    
    var topCard: QuestionCard {
        return cards[0]
    }
    var bottomCard: QuestionCard {
        return cards[cards.count - 1]
    }
    
    var count: Int {
        return cards.count
    }
    
    func position(of card: QuestionCard) -> Int {
        return cards.firstIndex(of: card) ?? 0
    }
    
    func scale(of card: QuestionCard) -> CGFloat {
        let deckPosition = position(of: card)
        let scale = CGFloat(deckPosition) * 0.02
        return CGFloat(1 - scale)
    }
    
    func deckOffset(of card: QuestionCard) -> CGFloat {
        let deckPosition = position(of: card)
        let offset = deckPosition * -10
        return CGFloat(offset)
    }
    
    func zIndex(of card: QuestionCard) -> Double {
        return Double(count - position(of: card))
    }
    
    func rotation(for card: QuestionCard, offset: CGSize = .zero) -> Angle {
        return .degrees(Double(offset.width) / 20.0)
    }
    
    mutating func moveToBack(_ state: QuestionCard) {
        let topCard = cards.remove(at: position(of: state))
        cards.append(topCard)
    }
    
    mutating func moveToFront(_ state: QuestionCard) {
        let topCard = cards.remove(at: position(of: state))
        cards.insert(topCard, at: 0)
    }
}
