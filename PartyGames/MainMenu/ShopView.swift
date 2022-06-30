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
            LazyVStack(alignment: .leading, spacing: 12){
                Text("Cosmetics")
                    .bold()
                    .font(.system(size: 42))
                    .padding(.top, 24)
                    .padding(.leading, 8)
                Divider()
                Text("TurnDisplays")
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                VStack(spacing: 0){
                    Rectangle().frame(height: 1)
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(turnDisplay.allCases, id: \.self) { item in
                                SmallShopItemView(item: getViewForTurnDisplay(display: item))
                                    .padding(.horizontal, 8)
                            }
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
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(backOfCards.allCases, id: \.self) { item in
                                SmallDisplayBackOfCard(item: getViewForBackOfCards(backOfCard: item))
                                    .padding(.horizontal, 8)
                            }
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
    case myNameIs, wantedPoster
}

enum backOfCards: CaseIterable {
    case emojis, gradient, colerFullCircle, manLookingThroughCard, actionImage
}

func getViewForTurnDisplay(display: turnDisplay) -> ShopItem{
    switch display {
    case .myNameIs:
        return ShopItem(view: AnyView(MyNameIsTurnDisplay(name: "Steve")), name: "HelloMyNameIs")
    case .wantedPoster:
        return ShopItem(view: AnyView(WantedPosterTurnDisplayer(name: "Steve")), name: "WantedPoster")
    }
}

func getViewForBackOfCards(backOfCard: backOfCards) -> ShopItem{
    switch backOfCard {
    case .emojis:
        return ShopItem(view: AnyView(EmojiBackOfCard()), name: "Emojis")
    case .gradient:
        return ShopItem(view: AnyView(GradientBackOfCard()), name: "Gradient")
    case .colerFullCircle:
        return ShopItem(view: AnyView(ColorFullCircle()), name: "ColerFullCircle")
    case .manLookingThroughCard:
        return ShopItem(view: AnyView(ManLookingThroughBackOfCard()), name: "YouHome")
    case .actionImage:
        return ShopItem(view: AnyView(ActionBackOfCard()), name: "ActionCard")
    }
    
}
