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
    var displayed: [QuestionCard] {get set}
    var cards: [QuestionCard] {get set}
}

extension QuestionCardStack {
    
    
    var topCard: QuestionCard {
        return displayed[0]
    }
    
    var count: Int {
        return cards.count + displayed.count
    }
    
    func position(of card: QuestionCard) -> Int {
        return displayed.firstIndex(of: card) ?? 0
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
    
    mutating func moveToBack(card: QuestionCard) {
        let topCard = displayed.remove(at: position(of: card))
        displayed.append(topCard)
    }
    
    mutating func moveToFront(card: QuestionCard) {
        let topCard = displayed.remove(at: position(of: card))
        displayed.insert(topCard, at: 0)
    }
    
    mutating func changeLastCard(){
        cards.append(displayed[displayed.count - 1])
        displayed.remove(at: displayed.count - 1)
        displayed.append(cards[0])
        cards.remove(at: 0)
        
    }
    
    func offset(for card: QuestionCard) -> CGSize {
        if card != activeCard {return .zero}
        
        return topCardOffset
    }
}




