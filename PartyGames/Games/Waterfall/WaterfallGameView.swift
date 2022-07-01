//
//  WaterfallGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI
import ExytePopupView

struct WaterfallGameView: View {
    @ObservedObject var vm = WaterfallViewModel()
    @State var inspectCard = false
    @State var openRules = false
    @State var openSettings = false
    @State var gameOver = false
    @State var openHands = false
    var body: some View {
        VStack(alignment: .trailing){
            HStack{
                Spacer()
                Button {
                    openHands.toggle()
                } label: {
                    Image(systemName: "hand.raised.fill")
                        .foregroundColor(vm.game.customizedSettings.players.isEmpty ? .gray : .green)
                        .padding()
                }
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
            }.padding(.trailing, 10)
            ZStack {
                GeometryReader { geometry in
                    ForEach(vm.game.displayed) { card in
                        CardView(card: card,
                                 animationTime: vm.game.customizedSettings.animationTime,
                                 inFocusWidth: vm.game.bigCardWidth(geometry: geometry),
                                 width: vm.game.smallCardWidth(screen: geometry),
                                 inFocusHeight: vm.game.bigCardHeight(geometry: geometry),
                                 height: vm.game.smallCardHeight(screen: geometry))
                        .zIndex(vm.game.zIndex(of: card))
                        .shadow(radius: 1)
                        .offset(y: vm.game.deckOffset(of: card))
                        .scaleEffect(x: vm.game.scale(of: card), y: vm.game.scale(of: card))
                        .onTapGesture {
                            if let cardsIndex = vm.game.displayed.firstIndex(of: card){
                                vm.selectedCard = card
                                if vm.game.displayed[cardsIndex].inFocus == true {
                                    inspectCard = true
                                    vm.game.displayed[cardsIndex].revealContent.toggle()
                                }
                            }
                        }
                        .padding(.trailing, 8)
                        .offset(x: card.inFocus ? vm.game.bigCardFindX(geometry: geometry) : 0,
                                y: card.inFocus ? vm.game.bigCardFindY(geometry: geometry, card: card) : 0)
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomTrailing)
                }
            }
            .overlay {
                VStack{
                    HStack{
                        Spacer()
                        if !vm.game.customizedSettings.players.isEmpty {
                            HStack{
                                Spacer()
                                //TODO: Display selected TurnDisplayer
                                MyNameIsTurnDisplay(name: vm.game.whosTurn())
                            }
                            .padding(.trailing, 16)
                        }
                    }
                    Spacer()
                }
                
            }
        }.onAppear {
            vm.game.SetupGame()
            vm.game.additionalSetup()
            withAnimation(.easeInOut(duration: 0.5)){
                for index in 0...2 {
                    vm.game.displayed[index].inFocus.toggle()
                }
            }
        }
        .sheet(isPresented: $openSettings) {
            WaterfallSettingsView(settings: vm.game.customizedSettings)
        }
        .sheet(isPresented: $openRules) {
            SlapTheQueenRules()
        }
        .sheet(isPresented: $gameOver) {
            WaterfallHandsView(game: $vm.game, title: "GAME_OVER")
        }
        .sheet(isPresented: $openHands, content: {
            WaterfallHandsView(game: $vm.game, title: "PAUSE")
        })
        .popup(isPresented: $inspectCard, type: .default, position: .bottom, closeOnTapOutside: true, dismissCallback: {
            //TODO: Append to hands
            if !vm.game.customizedSettings.players.isEmpty {
                if vm.game.customizedSettings.cardsToKeep.contains( vm.selectedCard!.cardType) {
                    vm.game.customizedSettings.players[vm.game.turnCounter % vm.game.customizedSettings.players.count].addCard(card: vm.selectedCard!)
                    vm.game.turnCounter += 1
                }
            }
            for index in 0...(vm.game.displayed.count > 3 ? 2 : vm.game.displayed.count - 1) {
                if vm.game.displayed[index].id == vm.selectedCard?.id && vm.game.customizedSettings.infinityCards {
                    withAnimation(.easeIn(duration: vm.game.customizedSettings.animationTime)){
                        vm.game.displayed[index].inFocus = false
                        vm.selectedCard?.revealContent = false
                        vm.game.usedDecks.append(vm.selectedCard!)
                        vm.game.usedDecks.shuffle()
                        
                    }
                }
            }
            withAnimation(.easeOut(duration: vm.game.customizedSettings.animationTime)){
                vm.game.removeFirst(card: vm.selectedCard!, deck: &vm.game.displayed)
            }
            if !vm.game.usedDecks.isEmpty{
                vm.game.displayed.append(vm.game.usedDecks[0])
                //                if !game.customizedSettings.infinityCards {
                vm.game.usedDecks.remove(at: 0)
                //                }
            } else if vm.game.displayed.isEmpty {
                //TODO: Go to gameover screen
            }
            withAnimation(.easeInOut(duration: vm.game.customizedSettings.animationTime)){
                if vm.game.displayed.count > 2 {
                    vm.game.displayed[2].inFocus = true
                }
            }
        }){
            CardView(card: vm.selectedCard!, animationTime: 1)
                .shadow(radius: 5)
                .onAppear {
                    vm.selectedCard?.revealContent.toggle()
                }
        }
    }
}

struct WaterfallGameView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallGameView()
    }
}
