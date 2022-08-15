//
//  MainMenu.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 15/06/2022.
//

import SwiftUI

struct MainMenu: View {
    @StateObject var storeManager: StoreManager
    @State var openShopSheet: Bool = false
    @State var showToast: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                AnimatedText()
            
                VStack(alignment: .center, spacing: 0){
                    Spacer()
                    Text("XD's")
                        .foregroundColor(.red)
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                        .shadow(radius: 2)
                    Text("Games")
                        .fontWeight(.medium)
                        .padding(.bottom, 18)
                        .foregroundColor(.white)
                        .font(.custom("Inconsolata", size: 32))
                    
                    GameItem(gameName: String(localized: "SlapTheQueen"), game: AnyView(SlapTheQueenGameView()), rules: AnyView(SlapTheQueenRules()))
                        .padding(.bottom)
                    GameItem(gameName: String(localized: "quesionsGame"), game: AnyView(QuestionCardsStackView()), rules: AnyView(QuestionGameRules()))
                        .padding(.bottom)
                    GameItem(gameName: "Waterfall", game: AnyView(WaterfallGameView()), rules: AnyView(WaterfallRules()))
                        .padding(.bottom)
                    GameItem(gameName: "Dices", game: AnyView(DicesGameView()), rules: AnyView(DicesRules()))
                        .padding(.bottom)
                    Button {
                        if storeManager.myProducts.count > 0 {
                            openShopSheet.toggle()
                            showToast = false
                        } else {
                            withAnimation(.linear(duration: 1)) {
                                showToast.toggle()
                            }
                        }
                    } label: {
                        ZStack{
                        Image(systemName: "bag.fill")
                            .font(.custom("Inconsolata", size: 32))
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.purple, lineWidth: 3)
                            )
                            .padding(.top, 16)
                            if showToast {
                                Text("Please try again later")
                                    .offset(y: 58)
                                    
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                    }
                }
            }.background(.black)
        }
        .sheet(isPresented: $openShopSheet) {
            ShopView(storeManager: storeManager)
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(storeManager: StoreManager())
    }
}
