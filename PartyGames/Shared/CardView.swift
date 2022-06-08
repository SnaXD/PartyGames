//
//  CardView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack {
            if card.revealContent {
                VStack {
                    SmallNumberAndType(card: card)
                    Spacer()
                    
                    HStack(spacing: 0){
                        Image(systemName: card.suite.rawValue)
                            .foregroundColor(Color.white)
                            .font(.system(size: 60))
                        Text(card.cardType.rawValue)
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    SmallNumberAndType(card: card)
                        .rotationEffect(.degrees(180))
                }
            }
        }
        
        .frame(width: 300, height: 400)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.gray)
        )
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suite: .clubs, cardType: .eight))
    }
}
