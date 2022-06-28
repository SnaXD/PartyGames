//
//  Deck.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct Deck {
    var cards = [Card]()
    init() {
        for suite in Suite.allCases {
//            for card in CardTypes.allCases {
            cards.append(Card(suite: suite, cardType: .four))
//            }
        }
    }
}
