//
//  SmallDisplayBackOfCard.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct SmallDisplayBackOfCard: View {
    let item: ShopItem
    var body: some View {
        VStack{
            ZStack{
                ShopItemFrame()
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 3)
                    .overlay(
                        item.view
                    )
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(radius: 1)
                    .frame(width: 100, height: 125)
            }
            Text(LocalizedStringKey(item.name))
        }.padding(.top, 8)
    }
}

struct SmallDisplayBackOfCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallDisplayBackOfCard(item: ShopItem(view: AnyView(GradientBackOfCard()), name: "Gradient"))
    }
}
