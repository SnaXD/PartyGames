//
//  QuestionCard.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct QuestionCard: Identifiable, Equatable, Hashable {
    let id = UUID()
    let question: String
}
