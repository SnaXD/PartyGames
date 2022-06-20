//
//  CardstackExtention.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 20/06/2022.
//

import SwiftUI

protocol QuestionCardStack {
    var topCardOffset: CGSize {get set}
    var activeCard: QuestionCard? {get set}
    
    var cards: [QuestionCard] {get set}
    var customizedSettings: StandardCustomization {get set}
}

extension QuestionCardStack {
    
    
    var topCard: QuestionCard {
        return cards[0]
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
    
    func offset(for card: QuestionCard) -> CGSize {
        if card != activeCard {return .zero}
        
        return topCardOffset
    }
}




