//
//  ShowViewModel.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 05/07/2022.
//

import Foundation
import SwiftUI

class ShopViewModel {
    
    func getViewForTurnDisplay(display: turnDisplay) -> ShopItem{
        let items = CosmeticViews.shared
        switch display {
        case .myNameIs:
            return ShopItem(view: items.getViewForTurnDisplayer(name: "Steve", turnDisplayer: .myNameIs), name: "HelloMyNameIs")
        case .wantedPoster:
            return ShopItem(view: items.getViewForTurnDisplayer(name: "Steve", turnDisplayer: .wantedPoster), name: "WantedPoster")
        case .ufo:
            return ShopItem(view: items.getViewForTurnDisplayer(name: "Steve", turnDisplayer: .ufo), name: "Ufo")
        case .standard:
            return ShopItem(view: items.getViewForTurnDisplayer(name: "Steve", turnDisplayer: .standard), name: "Standard")
        }
    }
    
    func getViewForBackOfCards(backOfCard: backOfCards) -> ShopItem{
        let items = CosmeticViews.shared
        switch backOfCard {
        case .emoji:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .emoji, preview: true), name: "Emoji")
        case .gradient:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .gradient), name: "Gradient")
        case .colerFullCircle:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .colerFullCircle), name: "ColerFullCircle")
        case .manLookingThroughCard:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .manLookingThroughCard), name: "YouHome")
        case .actionImage:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .actionImage), name: "ActionCard")
        case .standard:
            return ShopItem(view: items.getViewForBackgroundImage(cardBackground: .standard), name: "Standard")
        }
        
    }
}

enum turnDisplay: String, CaseIterable {
    case standard, myNameIs, wantedPoster, ufo
}

enum backOfCards: String, CaseIterable {
    case standard, emoji, gradient, colerFullCircle, manLookingThroughCard, actionImage
}
