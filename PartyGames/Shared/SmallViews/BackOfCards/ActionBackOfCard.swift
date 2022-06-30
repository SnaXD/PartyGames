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
            HStack{
                Spacer()
            }
            Spacer()
        }.overlay {
            Image("ActionBackOfCard")
                .resizable()
                .scaledToFill()
        }
    }
}

struct ActionBackOfCard_Previews: PreviewProvider {
    static var previews: some View {
        ActionBackOfCard()
    }
}
