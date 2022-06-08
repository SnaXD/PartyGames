//
//  PlayingCardsStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct PlayingCardsStack: View {
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
                ForEach(deck.cards) { card in
                    CardView(card: card)
                        .zIndex(self.deck.zIndex(of: card))
                        .shadow(radius: 1)
                        .offset(x: self.offset(for: card).width, y: self.offset(for: card).height)
                        .offset(y: self.deck.deckOffset(of: card))
                        .scaleEffect(x: self.deck.scale(of: card), y: self.deck.scale(of: card))
                        .rotationEffect(self.rotation(for: card))
                }
            }.onTapGesture {
                openSettings.toggle()
            }
            Spacer()
            HStack{
                Button {
                    deck.cards[0].revealContent = false
                    withAnimation {
                        self.deck.moveToBack(deck.topCard)
                    }
                    deck.cards[0].revealContent = true
                } label: {
                    Text("New card")
                }
                .padding(.horizontal, 32)
                
                Button {
                    deck.cards[0].revealContent = false
                    withAnimation {
                        self.deck.moveToFront(deck.bottomCard)
                    }
                    deck.cards[0].revealContent = true
                } label: {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                }
            }
            Spacer()
        }.sheet(isPresented: $openSettings) {
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
