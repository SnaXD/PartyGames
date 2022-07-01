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
