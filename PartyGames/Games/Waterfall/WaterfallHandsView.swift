//
//  WaterfallGameOver.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct WaterfallHandsView: View {
    @Binding var game: WaterfallGame
    var title: String
    var body: some View {
        VStack{
            Text(LocalizedStringKey(title))
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
                ScrollView(showsIndicators: false){
                    VStack{
                        ForEach($game.customizedSettings.players) { player in
                            HStack{
                                Text(player.name.wrappedValue)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                Spacer()
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(player.cardsOnHand) { card in
                                            CardView(card: card.wrappedValue, animationTime: game.customizedSettings.animationTime, inFocusWidth: 50, width: 50, inFocusHeight: 50, height: 50, fontSize: 20, includeTopBottomCardType: false)
                                                .contentShape(Rectangle())
                                                .onTapGesture {
                                                    print("ALLALALALALd213")
                                                    print(card.wrappedValue.cardType.rawValue)
                                                    card.wrappedValue.revealContent.toggle()
                                                }
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
                }.frame(minHeight: 130, maxHeight: 430)
            }
            //            HStack(spacing: 46){
            //                Button {
            //                    let oldSettings = game.customizedSettings
            //                    @State var newGame = WaterfallGame()
            //                    newGame.customizedSettings = oldSettings
            //                    game = newGame
            //                    game.SetupGame()
            //                } label: {
            //                    Text("Play_again")
            //                        .font(.custom("PressStart2P-Regular", size: 14))
            //                        .foregroundColor(.white)
            //                }
            //                Button {
            //                    //TODO: Main menu
            //                } label: {
            //                    Text("Main_Menu")
            //                        .font(.custom("PressStart2P-Regular", size: 12))
            //                        .foregroundColor(.white)
            //                }
            //            }
            Spacer()
            HStack{
                Spacer()
            }
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
        WaterfallHandsView(game: $game, title: "GAME_OVER")
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
