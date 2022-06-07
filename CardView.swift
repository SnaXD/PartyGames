//
//  CardView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct CardView: View {
    @State var card: Card
    
    var body: some View {
        VStack {
            if $card.wrappedValue.revealContent {
                VStack {
                    HStack{
                        Image(systemName: card.suite.rawValue)
                            .foregroundColor(Color.white)
                        Text(card.cardType.rawValue)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    }
                    Divider()
                    Spacer()
                    
                    HStack(spacing: 0){
                        Image(systemName: card.suite.rawValue)
                            .foregroundColor(Color.white)
                            .font(.system(size: 40))
                        Text(card.cardType.rawValue)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
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
