//
//  WaterfallGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import Foundation
import SwiftUI

struct WaterfallGame: PlayingCardStack {
    @ObservedObject var customizedSettings = WaterfallCustomization()
    var usedDecks: [Card] = []
    var displayed: [Card] = [] //Indholder kun 5 kort
    
}
