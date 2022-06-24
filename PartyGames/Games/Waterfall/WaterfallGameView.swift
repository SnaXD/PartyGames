//
//  WaterfallGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct WaterfallGameView: View {
    @State var game = WaterfallGame()
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack{
                    //3 pickable cards
                    
                }
                VStack{
                    //Card stack
                    ZStack {
                        ForEach(game.displayed) { card in
                            CardView(card: card, animationTime: $game.customizedSettings.animationTime)
                                .zIndex(game.zIndex(of: card))
                                .shadow(radius: 1)
                                .offset(y: game.deckOffset(of: card))
                                .scaleEffect(x: game.scale(of: card), y: game.scale(of: card))
                        }
                    }
                    Spacer()
                    HStack{
                        Button {
                            game.displayed[0].revealContent = false
                                game.getNewCard()
                            if !game.displayed.isEmpty {
                                game.displayed[0].revealContent = true
                            }
                        } label: {
                            Text("New_card")
                        }
                        .padding(.horizontal, 32)
                        if game.customizedSettings.infinityCards {
                            Button {
                                game.displayed[0].revealContent = false
                                game.getLastCard()
                                game.displayed[0].revealContent = true
                            } label: {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct WaterfallGameView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallGameView()
    }
}
