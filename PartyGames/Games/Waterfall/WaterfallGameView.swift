//
//  WaterfallGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI
import ExytePopupView

struct WaterfallGameView: View {
    @State var inspectCard: Bool = false
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
                            if let cardsIndex = game.displayed.firstIndex(of: card){
                                game.selectedCard = game.displayed[cardsIndex]
                                if game.displayed[cardsIndex].inFocus == true {
                                    inspectCard.toggle()
                                    game.displayed[cardsIndex].revealContent.toggle()
                                }
                            }
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
        .popup(isPresented: $inspectCard, type: .default, position: .bottom, closeOnTapOutside: true, dismissCallback: {
            //TODO: Append to hands
            for index in 0...(game.displayed.count > 3 ? 2 : game.displayed.count - 1) {
                if !game.customizedSettings.infinityCards && game.displayed[index].id == game.selectedCard?.id {
                    withAnimation(.easeIn(duration: game.customizedSettings.animationTime)){
                        game.displayed[index].inFocus = false
                        if game.customizedSettings.infinityCards {
                            game.selectedCard?.inFocus = false
                            game.selectedCard?.revealContent = false
                            game.usedDecks.append(game.selectedCard!)
                            game.usedDecks.shuffle()
                        }
                    }
                }
            }
            game.removeFirst(card: game.selectedCard!, deck: &game.displayed)
            if !game.usedDecks.isEmpty {
                game.displayed.append(game.usedDecks[0])
                game.usedDecks.remove(at: 0)
                print(game.displayed.count)
            } else if game.displayed.isEmpty {
                //TODO: Go to gameover screen
            }
            withAnimation(.easeInOut(duration: game.customizedSettings.animationTime)){
                if game.displayed.count > 2 {
                    game.displayed[2].inFocus = true
                }
            }
        }){
            ZStack{
                CardView(card: game.selectedCard!, animationTime: $game.customizedSettings.animationTime)
                    .shadow(radius: 5)
                    .onAppear {
                        game.selectedCard?.revealContent.toggle()
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
