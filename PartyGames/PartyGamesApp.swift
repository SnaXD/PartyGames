//
//  PartyGamesApp.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI
import StoreKit

@main
struct PartyGamesApp: App {
    
    @StateObject var storeManager = StoreManager()
    init(){
        CosmeticViews.shared.setupLastUsedCosmetics()
    }
    var body: some Scene {
        WindowGroup {
            MainMenu(storeManager: storeManager)
                .onAppear(perform: {
                    SKPaymentQueue.default().add(storeManager)
                    storeManager.getProducts(productIDs: ["EveryTurnDisplay"])
                })
            
        }
    }
}

