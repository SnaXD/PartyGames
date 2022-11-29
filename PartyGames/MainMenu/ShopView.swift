//
//  ShopView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var storeManager: StoreManager
    @State var vm = ShopViewModel()
    @ObservedObject var cosmetics = CosmeticViews.shared
    var body: some View {
        ZStack {
            ScrollView(){
                LazyVStack(alignment: .leading, spacing: 12){
                    HStack{
                        Spacer()
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color(uiColor: .systemBlue))
                            .font(.system(size: 20))
                            .padding(.trailing, 32)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                    HStack(alignment: .firstTextBaseline){
                        Text("Cosmetics")
                            .bold()
                            .font(.system(size: 42))
                            .padding(.leading, 8)
                            .foregroundColor(Color(uiColor: .systemGray2))
                        
                        Spacer()
                        
                        Button {
                            storeManager.restoreProducts()
                        } label: {
                            Text("Restore")
                                .font(.system(size: 12))
                                .foregroundColor(.blue)
                                .padding(.trailing, 10)
                        }
                        
                    }
                    .padding(.horizontal, 32)
                    Divider()
                    HStack{
                        Text("TurnDisplays")
                            .fontWeight(.semibold)
                            .padding(.leading, 8)
                            .foregroundColor(Color(uiColor: .systemGray2))
                        Spacer()
                        if UserDefaults.standard.bool(forKey: "EveryTurnDisplay") {
                            Text("Purchased")
                                .foregroundColor(.green)
                                .padding(.trailing, 8)
                        } else {
                            Button {
                                //TODO: Check for Wifi connection
                                storeManager.purchaseProduct(product: storeManager.myProducts[1])
                            } label: {
                                Text("Unlock")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.horizontal, 32)
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
                        .background(Color(uiColor: .systemGray2))
                        Rectangle().frame(height: 1)
                            .shadow(radius: 2)
                    }
                    HStack{
                        Text("BacksideOfCards")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(uiColor: .systemGray2))
                        Spacer()
                        if UserDefaults.standard.bool(forKey: "CardBackgrounds") {
                            Text("Purchased")
                                .foregroundColor(.green)
                        } else {
                            Button {
                                //TODO: Check for Wifi connection
                                storeManager.purchaseProduct(product: storeManager.myProducts[0])
                            } label: {
                                Text("Unlock")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.horizontal, 32)
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
                        .background(Color(uiColor: .systemGray2))
                        Rectangle().frame(height: 1)
                            .shadow(radius: 2)
                    }
                }
            }.padding(.vertical, 32)
            .background(Color(uiColor: .darkGray))
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


