//
//  Player.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var points: Int
    var cardsOnHand: [Card]
}
extension Player {
    mutating func addCard(card: Card) {
        cardsOnHand.append(card)
    }
    mutating func removeCard(card: Card) {
        for index in 0...cardsOnHand.count - 1 {
            if cardsOnHand[index] == card {
                cardsOnHand.remove(at: index)
            }
        }
        
    }
}
