//
//  GameItem.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 15/06/2022.
//

import SwiftUI

struct GameItem: View {
    let gameName: String
    let game: AnyView
    let rules: AnyView
    @State var openRulesSheet: Bool = false
    
    var body: some View {
        HStack(alignment: .center){
            NavigationLink{game} label: {
                Text(gameName)
                    .font(.custom("Inconsolata", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            Button {
                openRulesSheet.toggle()
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.blue)
                    .padding()
            }
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.purple, lineWidth: 3)
            )
        }.background(.black)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.purple, lineWidth: 3)
            )
            .sheet(isPresented: $openRulesSheet) {
                rules
            }
    }
}

struct GameItem_Previews: PreviewProvider {
    static var previews: some View {
        GameItem(gameName: "Slap the queen", game: AnyView(SlapTheQueenGameView()), rules: AnyView(SlapTheQueenRules()))
    }
}
