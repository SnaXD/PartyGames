//
//  WaterfallGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import Foundation
import SwiftUI

struct WaterfallGame: PlayingCardStack {
    @ObservedObject var customizedSettings = WaterfallCustomization()
    var usedDecks: [Card] = []
    var displayed: [Card] = [] //Indholder kun 5 kort
}

extension WaterfallGame {
    func smallCardWidth(screen: GeometryProxy) -> CGFloat {
        let paddingHorizontal: CGFloat = 8
        let result = (screen.size.width - paddingHorizontal) / 3
        return result
    }
    func smallCardHeight(screen: GeometryProxy) -> CGFloat {
        return screen.size.height / 6
    }
    
    func bigCardWidth(geometry: GeometryProxy) -> CGFloat{
        return geometry.size.width / 2
        
    }
    func bigCardHeight(geometry: GeometryProxy) -> CGFloat{
        return (geometry.size.height - 50) / 3
    }
    
    func bigCardFindX(geometry: GeometryProxy) -> CGFloat {
        let leadingPadding:CGFloat = 8 * 2
        return ((geometry.size.width - bigCardWidth(geometry: geometry) - leadingPadding) * -1)
    }
    
    func bigCardFindY(geometry: GeometryProxy, card: Card) -> CGFloat {
        let cardIndex = displayed.firstIndex(of: card)!
        let padding: CGFloat = 8
        let amountOfCardsShowing: CGFloat = 3
        let heightWithPadding = geometry.size.height + 40 - (padding * amountOfCardsShowing)
        let cardPlacement = heightWithPadding / amountOfCardsShowing * CGFloat(cardIndex)
        return cardPlacement
    }
}
