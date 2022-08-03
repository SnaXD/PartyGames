//
//  ShopView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct ShopView: View {
    @State var vm = ShopViewModel()
    @ObservedObject var cosmetics = CosmeticViews.shared
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
                                SmallShopItemView(item: vm.getViewForTurnDisplay(display: item))
                                    .padding(.horizontal, 8)
                                    .tint(item == cosmetics.selectedTurnDisplayer ? .yellow : .blue)
                                    .onTapGesture {
                                        cosmetics.selectedTurnDisplayer = item
                                        cosmetics.saveSelectedCosmetics()
                                    }
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
                                SmallDisplayBackOfCard(item: vm.getViewForBackOfCards(backOfCard: item), backgroundColor: cosmetics.getForgroundColor(for: item))
                                    .padding(.horizontal, 8)
                                    .tint(item == cosmetics.selectedCardBackground ? .yellow : .blue)
                                    .onTapGesture {
                                        cosmetics.selectedCardBackground = item
                                        cosmetics.saveSelectedCosmetics()
                                    }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color(uiColor: .systemGray6))
                    Rectangle().frame(height: 1)
                        .shadow(radius: 2)
                }
            }
        }.background(Color(uiColor: .systemGray5))
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}


