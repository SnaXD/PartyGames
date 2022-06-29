//
//  SmallNumberAndType.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct SmallNumberAndType: View {
    let card: Card
    var fontSize: CGFloat = 60
    var body: some View {
        HStack{
            Image(systemName: card.suite.rawValue)
                .foregroundColor(.white)
                .font(.system(size: fontSize / 2))
            Text(card.cardType.rawValue)
                .font(.system(size: fontSize / 2))
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
