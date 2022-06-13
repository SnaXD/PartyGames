//
//  PlayingCardsStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct PlayingCardsStack: View {
    @State var game = SlapTheQueenGame()
    @State var deck: Deck = Deck()
    @State var openRules: Bool = false
    @State var openSettings: Bool = false
    @State var settings = StandardCustomization()
    
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
                    CardView(card: card)
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
//                    withAnimation {
                        game.getNewCard()
//                    }
                    game.displayed[0].revealContent = true
                } label: {
                    Text("New card")
                }
                .padding(.horizontal, 32)
                if game.customizedSettings.infinityCards {
                    Button {
                        game.displayed[0].revealContent = false
    //                    withAnimation {
                        game.getLastCard()
    //                    }
                        game.displayed[0].revealContent = true
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                    }
                }
            }
            Spacer()
        }.onAppear(perform: {
            game.SetupGame()
        })
        .sheet(isPresented: $openSettings) {
            SettingsView(settings: $settings)
        }
        .sheet(isPresented: $openRules) {
            SlapTheQueenRules()
        }
    }
    
    func offset(for card: Card) -> CGSize {
        if card != self.deck.activeCard {return .zero}
        
        return deck.topCardOffset
    }
    
    func rotation(for card: Card) -> Angle {
        guard let activeCard = self.deck.activeCard
        else {return .degrees(0)}
        
        if card != activeCard {return .degrees(0)}
        
        return deck.rotation(for: activeCard, offset: deck.topCardOffset)
    }
}



struct PlayingCardsStack_Previews: PreviewProvider {
    static var previews: some View {
        PlayingCardsStack()
    }
}
