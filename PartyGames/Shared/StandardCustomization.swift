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
    
    func addPlayer(name: String, startup: Bool = false){
        players.append(Player(name: name, points: 0, cardsOnHand: []))
        if !startup {
            if var listOfNames = UserDefaults.standard.array(forKey: "listOfPlayerNames") as? [String] {
                listOfNames.append(name)
                UserDefaults.standard.set(listOfNames, forKey: "listOfPlayerNames")
            } else {
                let nameList: [String] = [name]
                UserDefaults.standard.set(nameList, forKey: "listOfPlayerNames")
            }
        }
    }
    func removePlayer(who player: Player){
        players.removeAll { elements in
            elements.id == player.id
        }
        if var listOfNames = UserDefaults.standard.array(forKey: "listOfPlayerNames") as? [String] {
            for index in 0...listOfNames.count - 1 {
                if listOfNames[index] == player.name {
                    listOfNames.remove(at: index)
                    break
                }
            }
            UserDefaults.standard.set(listOfNames, forKey: "listOfPlayerNames")
        }
    }
}
