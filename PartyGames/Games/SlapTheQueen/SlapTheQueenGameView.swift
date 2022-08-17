//
//  PlayingCardsStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct SlapTheQueenGameView: View {
    @State var game = SlapTheQueenGame()
    @State var openRules: Bool = false
    @State var openSettings: Bool = false
    @State var gameOver: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    openSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color(UIColor.darkGray))
                        .padding()
                }
                Button {
                    openRules.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            Spacer()
            ZStack {
                ForEach(game.displayed) { card in
                    game.customizedSettings.getInspectCard(card: card, alwaysInFocus: true)
                        .zIndex(game.zIndex(of: card))
                        .shadow(radius: 1)
                        .offset(y: game.deckOffset(of: card))
                        .scaleEffect(x: game.scale(of: card), y: game.scale(of: card))
                }
            }
            Spacer()
            HStack{
                if game.manualMode {
                    HStack{
                        Button {
                            game.displayed[0].revealContent = false
                            game.getNewCard()
                            if !game.displayed.isEmpty {
                                game.displayed[0].revealContent = true
                            } else {
                                //If every card has been played
                                gameOver.toggle()
                            }
                        } label: {
                            Text("New_card")//TODO: STYLE
                        }
                        .padding(.horizontal, 32)
                        
                        Button {
                            print($game.manualMode.wrappedValue)
                            $game.manualMode.wrappedValue.toggle()
                        } label: {
                            Text("Switch_to_automatic")//TODO: STYLE & translate
                        }
                        .padding(.horizontal, 32)
                    }
                } else {
                    HStack{
                        Button {
                            if game.timerIsRunning {
                                game.timerIsRunning = false
                            } else {
                                game.timerIsRunning = true
                            }
                        } label: {
                            Text("Stop/Start") //TODO: STYLE
                        }
                        Button {
                            print($game.manualMode.wrappedValue)
                            $game.manualMode.wrappedValue.toggle()
                        } label: {
                            Text("Switch_to_manual") //TODO: STYLE & translate
                        }
                    }
                }
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
            Spacer()
        }.onReceive(game.timer) { _ in
            if game.timerIsRunning {
                game.displayed[0].revealContent = false
                game.getNewCard()
                
                if game.displayed.isEmpty {
                    //If every card has been played
                    gameOver.toggle()
                    game.timerIsRunning = false
                } else {
                    game.displayed[0].revealContent = true
                    if game.checkForGestureCard() {
                        game.timerIsRunning = false
                    }
                }
            }
        }
        .onAppear(perform: {
            game.SetupGame()
        })
        .sheet(isPresented: $openSettings) {
            SlapTheQueenSettingsView(settings: game.customizedSettings)
        }
        .sheet(isPresented: $openRules) {
            SlapTheQueenRules()
        }
        .sheet(isPresented: $gameOver) {
            SlapTheQueenGameOver(game: $game)
        }
    }
}

struct PlayingCardsStack_Previews: PreviewProvider {
    static var previews: some View {
        SlapTheQueenGameView()
    }
}
