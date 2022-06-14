//
//  SlapTheQueenCustomization.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

let StandardCustomizationShared = StandardCustomization()
class StandardCustomization{
    
    var amountOfDecks = 1
    var includeJoker = false
    var infinityCards = false
    var players = [Player]()
    var animationTime = 1.0 
    
    func addPlayer(name: String){
        players.append(Player(name: name, points: 0))
    }
    
    func removePlayer(who player: Player){
        players.removeAll { elements in
            elements.id == player.id
        }
    }
}
