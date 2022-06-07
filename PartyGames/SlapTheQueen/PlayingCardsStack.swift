//
//  PlayingCardsStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct PlayingCardsStack: View {
    @State var deck: Deck = Deck()
    
    var body: some View {
        VStack{
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
        }
            HStack{
            Button {
                withAnimation {
                    self.deck.moveToBack(deck.topCard)
                }
            } label: {
                Text("New card")
            }
                Button {
                    withAnimation {
                        self.deck.moveToFront(deck.bottomCard)
                    }
                } label: {
                    Text("Revert")
                }
            }
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
