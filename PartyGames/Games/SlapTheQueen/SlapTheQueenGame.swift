//
//  SlapTheQueenGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct SlapTheQueenGame: PlayingCardStack{
    @ObservedObject var customizedSettings = StandardCustomization()
    var usedDecks: [Card] = []
    var displayed: [Card] = [] //Indholder kun 5 kort
    @State var runningAutomatic = false //TODO: Implement auto run
}
