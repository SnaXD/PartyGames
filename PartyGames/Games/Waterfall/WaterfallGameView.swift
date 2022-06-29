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
            HStack{
                Spacer()
                Button {
                    game.openSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color(UIColor.darkGray))
                        .padding()
                }
                Button {
                    game.openRules.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
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
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomTrailing)
                }
            }
         
        }.onAppear {
            game.SetupGame()
            game.additionalSetup()
            withAnimation(.easeInOut(duration: 1    )){
                for index in 0...2 {
                    game.displayed[index].inFocus.toggle()
                }
            }
        }
        .sheet(isPresented: $game.openSettings) {
            SettingsView(settings: game.customizedSettings)
        }
        .sheet(isPresented: $game.openRules) {
            SlapTheQueenRules()
        }
        .sheet(isPresented: $game.gameOver) {
            WaterfallGameOver(game: $game)
        }
        .popup(isPresented: $inspectCard, type: .default, position: .bottom, closeOnTapOutside: true, dismissCallback: {
            //TODO: Append to hands
            for index in 0...(game.displayed.count > 3 ? 2 : game.displayed.count - 1) {
                if game.displayed[index].id == game.selectedCard?.id && game.customizedSettings.infinityCards {
                    withAnimation(.easeIn(duration: game.customizedSettings.animationTime)){
                        game.displayed[index].inFocus = false
                        game.selectedCard?.revealContent = false
                        game.usedDecks.append(game.selectedCard!)
                        game.usedDecks.shuffle()
                        
                    }
                }
            }
                withAnimation(.easeOut(duration: game.customizedSettings.animationTime)){
                    game.removeFirst(card: game.selectedCard!, deck: &game.displayed)
                }
                if !game.usedDecks.isEmpty {
                    game.displayed.append(game.usedDecks[0])
                    //                if !game.customizedSettings.infinityCards {
                    game.usedDecks.remove(at: 0)
                    //                }
                } else if game.displayed.isEmpty {
                    //TODO: Go to gameover screen
                }
                withAnimation(.easeInOut(duration: game.customizedSettings.animationTime)){
                    if game.displayed.count > 2 {
                        game.displayed[2].inFocus = true
                    }
                }
            }){
                CardView(card: game.selectedCard!, animationTime: $game.customizedSettings.animationTime)
                    .shadow(radius: 5)
                    .onAppear {
                        game.selectedCard?.revealContent.toggle()
                    }
                
            }
        }
               }
               
               struct WaterfallGameView_Previews: PreviewProvider {
            static var previews: some View {
                WaterfallGameView()
            }
        }
