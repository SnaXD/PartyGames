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
            VStack(alignment: .trailing){
                HStack{
                    Spacer()
                    //Card stack
                    ZStack {
                        ForEach(game.displayed) { card in
                            CardView(card: card,
                                     animationTime: $game.customizedSettings.animationTime,
                                     inFocusWidth: game.bigCardWidth(geometry: geometry),
                                     width: game.smallCardWidth(screen: geometry),
                                     inFocusHeight: game.bigCardHeight(geometry: geometry),
                                     height: game.smallCardHeight(screen: geometry))
                            .zIndex(game.zIndex(of: card))
                            .shadow(radius: 1)
                            .offset(y: game.deckOffset(of: card))
                            .scaleEffect(x: game.scale(of: card), y: game.scale(of: card))
                            .onTapGesture {
                                let cardsIndex = game.displayed.firstIndex(of: card)
                                game.displayed[cardsIndex!].revealContent.toggle()
                            }
                            .padding(.trailing, 8)
                            .offset(x: card.inFocus ? game.bigCardFindX(geometry: geometry) : 0,
                                    y: card.inFocus ? game.bigCardFindY(geometry: geometry, card: card) : geometry.size.height / 2.5)
                        }
                    }
                }
                    Spacer()
                    HStack{
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)){
                                for index in 0...2 {
                                    game.displayed[index].inFocus.toggle()
                                }
                            }
                            //                            game.displayed[0].revealContent = false
                            //                                game.getNewCard()
                            //                            if !game.displayed.isEmpty {
                            //                                game.displayed[0].revealContent = true
                            //                            }
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
            
        }.onAppear {
            game.SetupGame()
        }
    }
}

struct WaterfallGameView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallGameView()
    }
}
