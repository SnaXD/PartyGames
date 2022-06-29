//
//  SlapTheQueenGameOver.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 14/06/2022.
//

import SwiftUI

struct SlapTheQueenGameOver: View {
    @Binding var game: SlapTheQueenGame
    @Environment(\.presentationMode) var presentationMode
    var placement = 1
    var body: some View {
        VStack{
            Text("GAME_OVER")
                .font(.custom("PressStart2P-Regular", size: 42))
                .foregroundColor(.red)
                .shadow(radius: 2)
                .padding(.bottom, 52)
                .padding(.top, 42)
            if !game.customizedSettings.players.isEmpty {
                Text("HIGH_SCORES")
                    .font(.custom("PressStart2P-Regular", size: 24))
                    .foregroundColor(.blue)
                    .padding(.bottom, 16)
                    .padding(.top, 42)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                    ForEach(0...game.customizedSettings.players.count - 1, id: \.self){ index in
                        Text(game.customizedSettings.players[index].name)
                            .font(.custom("PressStart2P-Regular", size: 16))
                            .foregroundColor(.red)
                            .padding(.bottom, 8)
                        Text(String(game.customizedSettings.players[index].points))
                            .font(.custom("PressStart2P-Regular", size: 16))
                            .foregroundColor(.red)
                            .padding(.bottom, 8)
                    }.onAppear {
                        var players = game.customizedSettings.players
                        players = players.sorted(by: {$0.points > $1.points })
                    }
                }
                HStack{
                    Spacer()
                    Text("Insert_Coin")
                        .font(.custom("PressStart2P-Regular", size: 10))
                        .foregroundColor(.white)
                }
                .padding(.top, 24)
            } else {
                HStack{
                    Spacer()
                }
            }
            HStack(spacing: 46){
                Button {
                    let oldSettings = game.customizedSettings
                    @State var newGame = SlapTheQueenGame()
                    newGame.customizedSettings = oldSettings
                    game = newGame
                    game.SetupGame()
                    close()
                } label: {
                    Text("Play_again")
                        .font(.custom("PressStart2P-Regular", size: 14))
                        .foregroundColor(.white)
                }
                Button {
                    //TODO: Main menu
                } label: {
                    Text("Main_Menu")
                        .font(.custom("PressStart2P-Regular", size: 12))
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 84)
            Spacer()
        }
        .interactiveDismissDisabled()
        .background(Color.black)
    }
    func close(){
        presentationMode.wrappedValue.dismiss()
    }
}

struct SlapTheQueenGameOver_Previews: PreviewProvider {
    static var previews: some View {
        SlapTheQueenGameOver_PreviewsWithBinding()
    }
}

struct SlapTheQueenGameOver_PreviewsWithBinding: View {
    @State var game = SlapTheQueenGame()
    var body: some View {
        SlapTheQueenGameOver(game: $game)
    }
}
