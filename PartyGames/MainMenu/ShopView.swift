//
//  ShopView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading, spacing: 12){
                Text("Cosmetics")
                    .bold()
                    .font(.custom("Inconsolata", size: 42))
                    .padding(.bottom, 24)
                    .padding(.leading, 8)
                Text("TurnDisplays")
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                VStack(spacing: 0){
                    Rectangle().frame(height: 1)
                    ScrollView(.horizontal){
                        ForEach(turnDisplay.allCases, id: \.self) { item in
                            SmallShopItemView(item: getViewForTurnDisplay(display: item))
                                .padding(.horizontal, 8)
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color(uiColor: .systemGray6))
                    Rectangle().frame(height: 1)
                        .shadow(radius: 2)
                }
                Text("BacksideOfCards")
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                    .padding(.top, 32)
                VStack(spacing: 0){
                    Rectangle().frame(height: 1)
                    ScrollView(.horizontal){
                        ForEach(backOfCards.allCases, id: \.self) { item in
                            SmallShopItemView(item: getViewForBackOfCards(backOfCard: item))
                                .padding(.horizontal, 8)
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color(uiColor: .systemGray6))
                    Rectangle().frame(height: 1)
                        .shadow(radius: 2)
                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

enum turnDisplay: CaseIterable {
    case myNameIs
}

enum backOfCards: CaseIterable {
    case emojis, gradient
}

func getViewForTurnDisplay(display: turnDisplay) -> ShopItem{
    switch display {
    case .myNameIs:
        return ShopItem(view: AnyView(MyNameIsTurnDisplay(name: "Steve")), name: "HelloMyNameIs")
    }
}

func getViewForBackOfCards(backOfCard: backOfCards) -> ShopItem{
    switch backOfCard {
    case .emojis:
        return ShopItem(view: <#T##AnyView#>, name: "Emojis")
    case .gradient:
        return ShopItem(view: <#T##AnyView#>, name: "Gradient")
    }
}
