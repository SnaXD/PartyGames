//
//  DicesGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct DicesGame: Dices {
    var dicesValue: [diceFaces] = []
    var dices: [diceFaces] = [.one, .two, .three, .four]
    
}
extension DicesGame {
    mutating func RerollDices() {
        dices.removeAll()
        for _ in 0...3 {
            dices.append(random())
        }
    }
}


