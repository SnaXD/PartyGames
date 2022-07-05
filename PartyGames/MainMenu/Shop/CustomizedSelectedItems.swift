//
//  CustomizedSelectedItems.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 05/07/2022.
//

import Foundation
import SwiftUI

class CustomizedSelectedItems{
    static let shared = CustomizedSelectedItems()
    
    var selectedCardBackground: backOfCards = .standard
    var selectedTurnDisplayer: turnDisplay = .standard
    
    func getViewForBackgroundImage() -> AnyView {
     return getViewForBackgroundImage(cardBackground: selectedCardBackground)
    }
    func getViewForBackgroundImage(cardBackground: backOfCards) -> AnyView {
        switch cardBackground {
        case .emojis:
            return AnyView(EmojiBackOfCard())
        case .gradient:
            return AnyView(GradientBackOfCard())
        case .colerFullCircle:
            return AnyView(ColorFullCircle())
        case .manLookingThroughCard:
            return AnyView(ManLookingThroughBackOfCard())
        case .actionImage:
            return AnyView(ActionBackOfCard())
        case .standard:
            return AnyView(StandardBackOfCards())
        }
    }
    
    
    func getViewForTurnDisplayer(name: String) -> AnyView {
        return getViewForTurnDisplayer(name: name, turnDisplayer: selectedTurnDisplayer)
    }
    func getViewForTurnDisplayer(name: String, turnDisplayer: turnDisplay) -> AnyView {
        switch turnDisplayer {
        case .myNameIs:
            return AnyView(MyNameIsTurnDisplay(name: "Steve"))
        case .wantedPoster:
            return AnyView(WantedPosterTurnDisplayer(name: "Steve"))
        case .ufo:
            return AnyView(UfoTurnDisplayer(name: "Steve"))
        case .standard:
            return AnyView(StandardTurnDisplayer(name: "Steve"))
        }
    }
    
}
