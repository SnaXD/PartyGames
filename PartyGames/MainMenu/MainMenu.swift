//
//  MainMenu.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 15/06/2022.
//

import SwiftUI

struct MainMenu: View {
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
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                }
            }.background(.black)
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
