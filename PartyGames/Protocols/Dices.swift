//
//  Dices.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

enum diceFaces: Int, CaseIterable {
    case one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, error = 7
}

protocol Dices {
    
}
extension Dices {
    func getDiceFace(dice: diceFaces) -> Array<Array<Int>> {
        switch dice {
        case .one:
            return [[0,0,0], [0,1,0], [0,0,0]]
        case .two:
            return [[0,0,1], [0,0,0], [1,0,0]]
        case .three:
            return [[0,0,1], [0,1,0], [1,0,0]]
        case .four:
            return [[1,0,1], [0,0,0], [1,0,1]]
        case .five:
            return [[1,0,1], [0,1,0], [1,0,1]]
        case .six:
            return [[1,0,1], [1,0,1], [1,0,1]]
        case .error:
            return [[0,0,0], [0,0,0], [0,0,0]]
        }
    }
    func random() -> diceFaces{
        return diceFaces.init(rawValue: Int.random(in: 1...6)) ?? .error
    }
}
