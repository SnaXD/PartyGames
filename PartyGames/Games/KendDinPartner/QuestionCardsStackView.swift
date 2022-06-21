//
//  CardsStack.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct QuestionCardsStackView: View {
    @State var game = QuestionGame()
    @State var openRules: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
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
                    QuestionCardView(card: card.question)
                        .zIndex(self.game.zIndex(of: card))
                        .shadow(radius: 2)
                        .offset(x: game.offset(for: card).width, y: game.offset(for: card).height)
                        .offset(y: self.game.deckOffset(of: card))
                        .scaleEffect(x: self.game.scale(of: card), y: self.game.scale(of: card))
                        .rotationEffect(game.rotation(for: card))
                        .gesture(
                            DragGesture()
                                .onChanged({ (drag) in
                                    if self.game.activeCard == nil {
                                        self.game.activeCard = card
                                    }
                                    if card != self.game.activeCard {return}

                                    withAnimation(.spring()) {
                                        self.game.topCardOffset = drag.translation
                                        if
                                            drag.translation.width < -200 ||
                                                drag.translation.width > 200 ||
                                                drag.translation.height < -250 ||
                                                drag.translation.height > 250 {
                                            self.game.moveToBack(card: card)
                                        } else {
                                            self.game.moveToFront(card: card)
                                        }
                                    }
                                })
                                .onEnded({ (drag) in
                                    withAnimation(.spring()) {
                                        self.game.activeCard = nil
                                        self.game.topCardOffset = .zero
                                        game.changeLastCard()
                                    }
                                    
                                })
                    )
                }
            }
            Spacer()
        }.onAppear(perform: {
            game.Setup()
        })
        .sheet(isPresented: $openRules) {
            SlapTheQueenRules()
        }
    }
}

//struct QuestionCardsStack: View {
//    @State var game: QuestionDeck = QuestionDeck()
//
//    var body: some View {
//        ZStack {
//            ForEach(game.cards) { card in
//                QuestionCardView(card: card)
//                    .zIndex(self.game.zIndex(of: card))
//                    .shadow(radius: 2)
//                    .offset(x: self.offset(for: card).width, y: self.offset(for: card).height)
//                    .offset(y: self.game.deckOffset(of: card))
//                    .scaleEffect(x: self.game.scale(of: card), y: self.game.scale(of: card))
//                    .rotationEffect(self.rotation(for: card))
//                    .gesture(
//                        DragGesture()
//                            .onChanged({ (drag) in
//                                if self.game.activeCard == nil {
//                                    self.game.activeCard = card
//                                }
//                                if card != self.game.activeCard {return}
//
//                                withAnimation(.spring()) {
//                                    self.game.topCardOffset = drag.translation
//                                    if
//                                        drag.translation.width < -200 ||
//                                            drag.translation.width > 200 ||
//                                            drag.translation.height < -250 ||
//                                            drag.translation.height > 250 {
//                                        self.game.moveToBack(card)
//                                    } else {
//                                        self.game.moveToFront(card)
//                                    }
//                                }
//                            })
//                            .onEnded({ (drag) in
//                                withAnimation(.spring()) {
//                                    self.game.activeCard = nil
//                                    self.game.topCardOffset = .zero
//                                }
//                            })
//                )
//            }
//        }
//    }
//
//    func offset(for card: QuestionCard) -> CGSize {
//        if card != self.game.activeCard {return .zero}
//
//        return game.topCardOffset
//    }
//
//    func rotation(for card: QuestionCard) -> Angle {
//        guard let activeCard = self.game.activeCard
//            else {return .degrees(0)}
//
//        if card != activeCard {return .degrees(0)}
//
//        return game.rotation(for: activeCard, offset: game.topCardOffset)
//    }
//}

struct CardsStack_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardsStackView()
    }
}
