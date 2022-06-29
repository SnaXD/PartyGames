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
    var displayed: [Card] = []
    var turnCounter = 0
}
extension WaterfallGame {
    //Make the stack of 8 cards for Cosmetic reasons
    mutating func additionalSetup(){
        for _ in 0...3 {
            if let moreCards = usedDecks.first {
                displayed.append(moreCards)
                usedDecks.remove(at: 0)
            }
        }
    }
    
    func whosTurn() -> String {
        let players = customizedSettings.players
        return players[turnCounter % players.count].name
    }
    func smallCardWidth(screen: GeometryProxy) -> CGFloat {
        let paddingHorizontal: CGFloat = 8
        let result = (screen.size.width - paddingHorizontal) / 2.5
        return result
    }
    func smallCardHeight(screen: GeometryProxy) -> CGFloat {
        return screen.size.height / 4
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
        return cardPlacement * -1
    }
    
}
