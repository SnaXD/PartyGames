//
//  MainMenu.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 15/06/2022.
//

import SwiftUI

struct MainMenu: View {
    @State var openShopSheet: Bool = false
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Spacer()
                Text("Games")
                    .fontWeight(.medium)
                    .padding(.vertical, 18)
                    .foregroundColor(.white)
                    .font(.custom("Inconsolata", size: 32))
                
                GameItem(gameName: String(localized: "SlapTheQueen"), game: AnyView(SlapTheQueenGameView()), rules: AnyView(SlapTheQueenRules()))
                    .padding(.bottom)
                GameItem(gameName: String(localized: "quesionsGame"), game: AnyView(QuestionCardsStackView()), rules: AnyView(QuestionGameRules()))
                GameItem(gameName: "Waterfall", game: AnyView(WaterfallGameView()), rules: AnyView(WaterfallRules()))
                Button {
                    openShopSheet.toggle()
                } label: {
                    Image(systemName: "bag.fill")
                }
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                }
            }.background(.black)
        }
        .sheet(isPresented: $openShopSheet) {
            ShopView()
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
