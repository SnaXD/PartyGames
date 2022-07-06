//
//  CustomizedSelectedItems.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 05/07/2022.
//

import Foundation
import SwiftUI

class CosmeticViews: ObservableObject, Cosmetics{
    static var shared = CosmeticViews()
    
    @Published var selectedCardBackground: backOfCards = .standard
    var selectedCardBackgroundsMatchingForgroundColor: Color = Color(uiColor: .systemGray2)
    @Published var selectedTurnDisplayer: turnDisplay = .standard
    
    func getForgroundColor(for background: backOfCards) -> Color{
        let standard = Color(uiColor: .systemGray2)
        switch background {
        case .standard:
            return standard
        case .emojis:
            return standard
        case .gradient:
            return Color(uiColor: .systemOrange)
        case .colerFullCircle:
            return standard
        case .manLookingThroughCard:
            return .yellow
        case .actionImage:
            return standard
        }
    }
    func getViewForBackgroundImage() -> AnyView {
        return getViewForBackgroundImage(cardBackground: selectedCardBackground)
    }
    func getViewForBackgroundImage(cardBackground: backOfCards) -> AnyView {
        selectedCardBackgroundsMatchingForgroundColor = getForgroundColor(for: cardBackground)
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
            return AnyView(MyNameIsTurnDisplay(name: name))
        case .wantedPoster:
            return AnyView(WantedPosterTurnDisplayer(name: name))
        case .ufo:
            return AnyView(UfoTurnDisplayer(name: name))
        case .standard:
            return AnyView(StandardTurnDisplayer(name: name))
        }
    }
}
