//
//  SlapTheQueenGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import Foundation
import SwiftUI

struct SlapTheQueenGame: PlayingCardStack{
    @ObservedObject var customizedSettings = StandardCustomization.Shared
    var usedDecks: [Card] = []
    var displayed: [Card] = [] //Indholder kun 5 kort
    @State var runningAutomatic = false //TODO: Implement auto run
    
    mutating func SetupGame(){
        var oneDeck = Deck().cards
        //Remove Jokers if requested
        if !customizedSettings.includeJoker {
            oneDeck.removeAll { card in
                card.cardType == .joker
            }
        }
        
        //Adds Multiple decks
        for _ in 1...(Int(customizedSettings.amountOfDecks) ?? 1) {
            usedDecks.append(contentsOf: oneDeck)
        }
        
        //Shuffle the cards
        usedDecks = usedDecks.shuffled()
        
        //Adds 5 first cards to displayed Array
        for _ in 0...4 {
            if let moreCards = usedDecks.first {
                displayed.append(moreCards)
                usedDecks.remove(at: 0)
            }
        }
        
        //Sets Players points to 0
        if !customizedSettings.players.isEmpty {
            for index in 0...customizedSettings.players.count - 1 {
                customizedSettings.players[index].points = 0
            }
        }
    }
}
