//
//  WaterfallViewModel.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/07/2022.
//

import SwiftUI

class WaterfallViewModel: ObservableObject {
    @Published var selectedCard: Card? = nil
    @Published var game = WaterfallGame()
}
extension WaterfallViewModel {
    func getInspectCard(proxy: GeometryProxy) -> AnyView {
        var height: CGFloat = 0
        var width: CGFloat = 0
        var fontSize: CGFloat = 60
        switch game.customizedSettings.inspectCardSize {
        case .normal:
            height = 400
            width = 300
            fontSize = 60
        case .large:
            height = proxy.size.height / 4 * 3
            width = proxy.size.width / 4 * 3
            fontSize = 100
        case .max:
            height = proxy.size.height
            width = proxy.size.width
            fontSize = 170
        }
        return AnyView(CardView(card: selectedCard!, animationTime: 1, inFocusWidth: width , inFocusHeight: height, fontSize: fontSize)
            .shadow(radius: 5)
            .onAppear {
                self.selectedCard?.revealContent.toggle()
            }
        )
    }
}
