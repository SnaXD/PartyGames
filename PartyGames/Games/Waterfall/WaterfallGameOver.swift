//
//  WaterfallGameOver.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct WaterfallGameOver: View {
    @Binding var game: WaterfallGame
    var body: some View {
        VStack{
            Text("GAME_OVER")
                .font(.custom("PressStart2P-Regular", size: 42))
                .foregroundColor(.white)
                .shadow(radius: 2)
                .padding(.bottom, 52)
                .padding(.top, 42)
            
            if !game.customizedSettings.players.isEmpty {
                HStack{Text("Name")
                    Spacer()
                    Text("Hand")
                }
                .padding(.horizontal, 16)
                .font(.system(size: 12))
                ScrollView{
                    ForEach($game.customizedSettings.players) { player in
                        HStack{
                            Text(player.name.wrappedValue)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                            Spacer()
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(player.cardsOnHand) { card in
                                        CardView(card: card.wrappedValue, animationTime: game.customizedSettings.animationTime, width: 50, height: 50, fontSize: 20, includeTopBottomCardType: false)
                                            .onAppear {
                                                card.revealContent.wrappedValue = true
                                            }
                                    }
                                }
                            }.scaledToFit()
                        }.frame(height: 50)
                        Divider()
                    }
                    .padding(.horizontal, 16)
                }
            }
            Spacer()
        }
        .background(Color(UIColor.systemGreen))
    }
}

struct WaterfallGameOver_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallGameOver_PreviewsWithBinding()
    }
}
struct WaterfallGameOver_PreviewsWithBinding: View {
    @State var game = WaterfallGame(customizedSettings: createSettings())
    var body: some View {
        WaterfallGameOver(game: $game)
    }
}

func createSettings() -> WaterfallCustomization {
    let settings = WaterfallCustomization()
    for index in 0...5 {
        settings.addPlayer(name: "Player\(index)")
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .ten, color: .black))
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .two, color: .black))
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .king, color: .black))
    }
    return settings
}
