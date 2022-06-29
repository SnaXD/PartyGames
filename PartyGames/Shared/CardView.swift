//
//  CardView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @Binding var animationTime: Double
    @State var t = 180.0
    @State var showFrontPage = false
    var inFocusWidth: CGFloat = 300
    var width: CGFloat = 300
    var inFocusHeight: CGFloat = 400
    var height: CGFloat = 400
    var fontSize: CGFloat = 60
    var includeTopBottomCardType = true
    var body: some View {
        VStack {
            if card.revealContent {
                Group {
                    if showFrontPage {
                        VStack {
                            if includeTopBottomCardType {
                                SmallNumberAndType(card: card, fontSize: fontSize)
                            }
                            Spacer()
                            HStack(spacing: 0){
                                Image(systemName: card.suite.rawValue)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: fontSize))
                                Text(card.cardType.rawValue)
                                    .font(.system(size: fontSize))
                                    .foregroundColor(.white)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                            if includeTopBottomCardType {
                                SmallNumberAndType(card: card, fontSize: fontSize)
                                    .rotationEffect(.degrees(180))
                            }
                        }
                    } else {
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }.onAppear(perform: {
                    flipAnimation()
                })
                .onDisappear {
                    t = 0
                    withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
                        showFrontPage.toggle()
                    }
                }
            }
        }
        .frame(width: card.inFocus ? inFocusWidth : width,
               height: card.inFocus ? inFocusHeight : height)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.gray)
        )
        .rotation3DEffect(.degrees(t), axis: (x: 0, y: 1, z: 0))
    }
    func flipAnimation() {
        t = 180.0
        withAnimation(Animation.linear(duration: animationTime))  {
            t += 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            showFrontPage.toggle()
        }
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView_PreviewsWithBinding()
    }
}

struct CardView_PreviewsWithBinding: View {
    @State var animationTime = 1.0
    var body: some View {
        CardView(card: Card(suite: .clubs, cardType: .eight), animationTime: $animationTime)
    }
}
