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
    let question: String
    let color: Color
}
