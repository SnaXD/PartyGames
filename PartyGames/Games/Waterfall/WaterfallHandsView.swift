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
                HStack{
                    Text("Name")
                    Spacer()
                    Text("Hand")
                }
                .padding(.horizontal, 16)
                .font(.system(size: 12))
                ScrollView(showsIndicators: false){
                    VStack{
                        ForEach($game.customizedSettings.players) { $player in
                            HStack{
                                Text($player.name.wrappedValue)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                Spacer()
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach($player.cardsOnHand) { $card in
                                            CardView(card: $card.wrappedValue, animationTime: game.customizedSettings.animationTime, inFocusWidth: 50, width: 50, inFocusHeight: 50, height: 50, fontSize: 20, includeTopBottomCardType: false)
                                                .contentShape(Rectangle())
                                                .contextMenu{
                                                    Button("Flip") {
                                                        withAnimation(.easeInOut(duration: 1.0)){ $card.wrappedValue.revealContent.toggle()}
                                                    }
                                                    Button {
                                                        withAnimation(.easeInOut(duration: 1.0)){ $player.wrappedValue.removeCard(card: $card.wrappedValue) }
                                                    } label: {
                                                        Text("Remove")
                                                    }
                                                    ForEach(game.customizedSettings.players) { player in
                                                        if player.id != $player.id.wrappedValue {
                                                            Button {
                                                                if let selectedPlayerIndex = game.customizedSettings.players.firstIndex(where: { listPlayer in
                                                                    listPlayer.id == player.id
                                                                }) {
                                                                    $game.customizedSettings.players[selectedPlayerIndex].wrappedValue.addCard(card: card)
                                                                    $player.wrappedValue.removeCard(card: card)
                                                                }
                                                            } label: {
                                                                HStack{
                                                                    Text("giveTo \(player.name)")
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                        }
                                    }
                                }.scaledToFit()
                            }.frame(height: 50)
                            Divider()
                        }
                        .padding(.horizontal, 16)
                    }
                }.frame(minHeight: 130)
            }
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
private struct WaterfallGameOver_PreviewsWithBinding: View {
    @State var game = WaterfallGame(customizedSettings: createSettings())
    var body: some View {
        WaterfallHandsView(game: $game, title: "GAME_OVER")
    }
}

private func createSettings() -> WaterfallCustomization {
    let settings = WaterfallCustomization()
    for index in 0...5 {
        settings.addPlayer(name: "Player\(index)")
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .ten, color: .black))
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .two, color: .black))
        settings.players[index].addCard(card: Card(suite: .clubs, cardType: .king, color: .black))
    }
    return settings
}
