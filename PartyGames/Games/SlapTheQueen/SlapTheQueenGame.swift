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
    var manualMode = true
    //Timer når den rammer tilsvarrende AnimationsTime
    
    var timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    var timerIsRunning = false
    
    func checkForGestureCard() -> Bool{
        if !displayed.isEmpty {
            switch displayed[0].cardType {
            case .jack, .queen, .king:
                return true
                
            default:
                return false
            }
        } else {
            return true
        }
    }
    
    mutating func startTimer(){
        timer = Timer.publish(every: customizedSettings.animationTime + 0.5, on: .main, in: .common).autoconnect()
    }
}
