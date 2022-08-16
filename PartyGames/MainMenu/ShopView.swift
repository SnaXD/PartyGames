//
//  ShopView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct ShopView: View {
    @StateObject var storeManager: StoreManager
    @State var vm = ShopViewModel()
    @ObservedObject var cosmetics = CosmeticViews.shared
    var body: some View {
        ZStack {
            ScrollView(){
                LazyVStack(alignment: .leading, spacing: 12){
                    HStack(alignment: .firstTextBaseline){
                        Text("Cosmetics")
                            .bold()
                            .font(.system(size: 42))
                            .padding(.top, 24)
                            .padding(.leading, 8)
                        
                        Spacer()
                        
                        Button {
                            storeManager.restoreProducts()
                        } label: {
                            Text("Restore")
                                .font(.system(size: 12))
                                .foregroundColor(.blue)
                                .padding(.trailing, 8)
                        }
                        
                    }
                    Divider()
                    HStack{
                        Text("TurnDisplays")
                            .fontWeight(.semibold)
                            .padding(.leading, 8)
                        Spacer()
                        if UserDefaults.standard.bool(forKey: "EveryTurnDisplay") {
                            Text("Purchased")
                                .foregroundColor(.green)
                                .padding(.trailing, 8)
                        } else {
                            Button {
                                //TODO: Check for Wifi connection
                                storeManager.purchaseProduct(product: storeManager.myProducts[0])
                            } label: {
                                Text("Unlock")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    VStack(spacing: 0){
                        Rectangle().frame(height: 1)
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack{
                                ForEach(turnDisplay.allCases, id: \.self) { item in
                                    SmallShopItemView(item: vm.getViewForTurnDisplay(display: item))
                                        .padding(.horizontal, 8)
                                        .tint(item == cosmetics.selectedTurnDisplayer ? .yellow : .blue)
                                        .onTapGesture {
                                            //if UserDefaults.standard.bool(forKey: "EveryTurnDisplay") {
                                                cosmetics.selectedTurnDisplayer = item
                                                cosmetics.saveSelectedCosmetics()
                                            //}
                                        }
                                }
                            }
                        }
                        .padding(.vertical, 8)
                        .background(Color(uiColor: .systemGray6))
                        Rectangle().frame(height: 1)
                            .shadow(radius: 2)
                    }
                    HStack{
                        Text("BacksideOfCards")
                            .fontWeight(.semibold)
                        Spacer()
                        if UserDefaults.standard.bool(forKey: "CardBackgrounds") {
                            Text("Purchased")
                                .foregroundColor(.green)
                        } else {
                            Button {
                                //TODO: Check for Wifi connection
                                storeManager.purchaseProduct(product: storeManager.myProducts[1])
                            } label: {
                                Text("Unlock")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
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
                                            //if UserDefaults.standard.bool(forKey: "CardBackgrounds") {
                                                cosmetics.selectedCardBackground = item
                                                cosmetics.saveSelectedCosmetics()
                                            //}
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
            if storeManager.myProducts.count == 0 {
                Rectangle()
                    .foregroundColor(Color(uiColor: .systemGray))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.6)
                
                VStack{
                    Text("TryingToLoad")
                    ProgressView()
                        .scaleEffect(x: 3, y: 3, anchor: .center)
                        .padding(28)
                    Text("Products")
                }
                .padding()
                .padding(.horizontal, 32)
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(uiColor: .systemGray3)))
                .shadow(radius: 1)
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(storeManager: StoreManager())
    }
}


