//
//  WaterfallGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI
import ExytePopupView

struct WaterfallGameView: View {
    @State var game = WaterfallGame()
    var body: some View {
        
        VStack(alignment: .trailing){
            ZStack {
                GeometryReader { geometry in
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
                                y: card.inFocus ? game.bigCardFindY(geometry: geometry, card: card) : 0)
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topTrailing)
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
                } label: {
                    Text("New_card")
                }
                .padding(.horizontal, 32)
            }
        }.onAppear {
            game.SetupGame()
            game.additionalSetup()
        }
        
        
    }
}

struct WaterfallGameView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallGameView()
    }
}
