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
            for card in CardTypes.allCases {
                cards.append(Card(suite: suite, cardType: card, color: getSuiteColor(suite: suite)))
            }
        }
    }
}

extension Deck {
    func getSuiteColor(suite: Suite) -> Color{
        switch suite {
        case .clubs:
            return .black
        case .diamonds:
            return .red
        case .hearts:
            return .red
        case .spades:
            return .black
        }
    }
}
