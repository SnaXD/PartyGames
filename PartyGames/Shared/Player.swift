//
//  Player.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var points: Int
}
