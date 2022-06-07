//
//  SlapTheQueenCustomization.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation

class SlapTheQueenCustomization{
    let shared = SlapTheQueenCustomization()
    
    var amountOfDecks = 1
    var includeJoker = false
    var infinityCards = false
    var players = [Player]()
    
    func addPlayer(name: String){
        players.append(Player(name: name, points: 0))
    }
}
