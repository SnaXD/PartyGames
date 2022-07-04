//
//  WaterfallCustomization.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import Foundation

class WaterfallCustomization: StandardCustomization {
    
    @Published var showRulesToCards = false
    @Published var cardsToKeep: [CardTypes] = [.six, .eight, .nine, .king, .one]
    @Published var inspectCardSize: inspectCardSizes = .normal
 
}
extension WaterfallCustomization {
    enum inspectCardSizes: String, CaseIterable{
        case normal, large, max
    }
}
