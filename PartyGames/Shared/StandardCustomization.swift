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
    @Published var inspectCardSize: inspectCardSizes = .normal
    
    enum inspectCardSizes: String, CaseIterable{
        case normal, large, max
    }
    
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
    
    func getInspectCard(card: Card, alwaysInFocus: Bool = false) -> AnyView {
        var modifiedCard = card
        if alwaysInFocus {
            modifiedCard.inFocus = true
        }
        var height: CGFloat = 0
        var width: CGFloat = 0
        var fontSize: CGFloat = 60
        switch inspectCardSize {
        case .normal:
            height = 400
            width = 300
            fontSize = 60
        case .large:
            height = 600
            width = 400
            fontSize = 100
        case .max:
            height = 800
            width = 600
            fontSize = 170
        }
        
        return AnyView(CardView(card: modifiedCard, animationTime: animationTime, inFocusWidth: width , inFocusHeight: height, fontSize: fontSize)
            .shadow(radius: 5)
        )
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
