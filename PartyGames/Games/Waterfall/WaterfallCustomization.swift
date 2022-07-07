//
//  WaterfallCustomization.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import Foundation

class WaterfallCustomization: StandardCustomization {
    
    @Published var showRulesToCards = false
    @Published var cardsToKeep: [CardTypes] = [.six, .eight, .nine, .king, .ace]
    @Published var inspectCardSize: inspectCardSizes = .normal
 
}
extension WaterfallCustomization {
    enum inspectCardSizes: String, CaseIterable{
        case normal, large, max
    }
    
    enum halfOfCardTypeParts: String, CaseIterable{
        case first, secound, third
    }
    func getHalfOfCardTypes(part: halfOfCardTypeParts) -> [CardTypes]{
        let max = CardTypes.allCases.count - 1
        var returnValue = [CardTypes]()
        var slice: ArraySlice<CardTypes>
       switch part {
       case .first:
           slice = CardTypes.allCases[0...(max / 2 - 1)] // 0 - 6
       case .secound:
           slice = CardTypes.allCases[(max / 2)...max - 2] // 7 - Q
       case .third:
           slice = CardTypes.allCases[(max - 2)...max] // K - Joker
       }
        slice.forEach { slice in
            returnValue.append(slice)
        }
        return returnValue
    }
}
