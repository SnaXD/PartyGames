//
//  SlapTheQueenCustomization.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI


class StandardCustomization: ObservableObject{
    
    @Published var amountOfDecks: String = "1"
    @Published var includeJoker = false
    @Published var infinityCards = false
    @Published var players = [Player]()
    @Published var animationTime = 1.0
    
    func addPlayer(name: String){
        players.append(Player(name: name, points: 0))
    }
    
    func removePlayer(who player: Player){
        players.removeAll { elements in
            elements.id == player.id
        }
    }
}
