//
//  ActionBackOfCard.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct ActionBackOfCard: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
            }
        }.background{
            Image("ActionBackOfCard")
                .resizable()
                .scaledToFill()
                .cornerRadius(12)
        }
    }
}

struct ActionBackOfCard_Previews: PreviewProvider {
    static var previews: some View {
        ActionBackOfCard()
    }
}
