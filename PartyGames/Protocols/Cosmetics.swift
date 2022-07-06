//
//  Cosmetics.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 06/07/2022.
//

import SwiftUI
import Foundation

protocol Cosmetics {
    var selectedCardBackground: backOfCards {get set}
    var selectedCardBackgroundsMatchingForgroundColor: Color {get set}
    var selectedTurnDisplayer: turnDisplay {get set}
    func getForgroundColor(for background: backOfCards) -> Color
}
extension Cosmetics {
    
    mutating func setupLastUsedCosmetics(){
        let cardBackground = UserDefaults.standard.string(forKey: "selectedBackground")
        let turnDisplayer = UserDefaults.standard.string(forKey: "selectedTurnDisplayer")
        backOfCards.allCases.forEach{graphic in
            if graphic.rawValue == cardBackground {
                selectedCardBackground = graphic
                selectedCardBackgroundsMatchingForgroundColor = getForgroundColor(for: graphic)
            }
        }
        turnDisplay.allCases.forEach { display in
            if display.rawValue == turnDisplayer {
                selectedTurnDisplayer = display
            }
        }
    }
    
    func saveSelectedCosmetics(){
        UserDefaults.standard.set(selectedCardBackground.rawValue, forKey: "selectedBackground")
        UserDefaults.standard.set(selectedTurnDisplayer.rawValue, forKey: "selectedTurnDisplayer")
    }
}
