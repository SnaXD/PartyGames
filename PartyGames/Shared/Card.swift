//
//  Card.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let suite: Suite
    let cardType: CardTypes
    let color: Color
    var revealContent: Bool = false
    var inFocus: Bool = false
}

enum Suite: String, CaseIterable {
    case clubs = "suit.club.fill"
    case diamonds = "suit.diamond.fill"
    case hearts = "heart.fill"
    case spades = "suit.spade.fill"
}

enum CardTypes: String, CaseIterable {
    case ace = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case knight = "J"
    case queen = "Q"
    case king = "K"
    case joker = "Joker"
}
