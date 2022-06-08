//
//  SmallNumberAndType.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct SmallNumberAndType: View {
    let card: Card
    var body: some View {
        HStack{
            Image(systemName: card.suite.rawValue)
                .foregroundColor(Color.white)
            Text(card.cardType.rawValue)
            .font(.title)
            .foregroundColor(.white)
            .bold()
            Spacer()
        }
        .padding(8)
    }
}

struct SmallNumberAndType_preview: PreviewProvider {
    static var previews: some View {
        SmallNumberAndType(card: Card(suite: .diamonds, cardType: .ten))
    }
}
