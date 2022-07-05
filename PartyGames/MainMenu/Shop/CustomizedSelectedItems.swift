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
    
    var selectedCardBackground: backOfCards = .gradient
    var selectedCardBackgroundsMatchingForgroundColor: Color = Color(uiColor: .systemGray2)
    var selectedTurnDisplayer: turnDisplay = .standard
    
    func getViewForBackgroundImage() -> AnyView {
     return getViewForBackgroundImage(cardBackground: selectedCardBackground)
    }
    func getViewForBackgroundImage(cardBackground: backOfCards) -> AnyView {
        switch cardBackground {
        case .emojis:
            selectedCardBackgroundsMatchingForgroundColor = Color(uiColor: .systemGray2)
            return AnyView(EmojiBackOfCard())
        case .gradient:
            selectedCardBackgroundsMatchingForgroundColor = Color(uiColor: .systemOrange)
            return AnyView(GradientBackOfCard())
        case .colerFullCircle:
            selectedCardBackgroundsMatchingForgroundColor = Color(uiColor: .systemGray2)
            return AnyView(ColorFullCircle())
        case .manLookingThroughCard:
            selectedCardBackgroundsMatchingForgroundColor = .yellow
            return AnyView(ManLookingThroughBackOfCard())
        case .actionImage:
            selectedCardBackgroundsMatchingForgroundColor = Color(uiColor: .systemGray2)
            return AnyView(ActionBackOfCard())
        case .standard:
            selectedCardBackgroundsMatchingForgroundColor = Color(uiColor: .systemGray2)
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
