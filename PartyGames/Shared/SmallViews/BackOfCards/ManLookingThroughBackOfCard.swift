//
//  ManLookingThroughBackOfCard.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct ManLookingThroughBackOfCard: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
            }
        }.background{
            Image("ManLookingThroughCard")
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                
        }
    }
}

struct ManLookingThroughBackOfCard_Previews: PreviewProvider {
    static var previews: some View {
        ManLookingThroughBackOfCard()
    }
}
