//
//  PartyGamesApp.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

@main
struct PartyGamesApp: App {
    
    init(){
        CosmeticViews.shared.setupLastUsedCosmetics()
    }
    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}

