//
//  SmallShopItemView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct SmallShopItemView: View {
    let item: ShopItem
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.tint, lineWidth: 3)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(radius: 1)
                    .frame(width: 225, height: 175)
                
                item.view
            }
            Text(LocalizedStringKey(item.name))
        }.padding(.top, 8)
    }
}

struct SmallShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        SmallShopItemView(item: ShopItem(view: AnyView(MyNameIsTurnDisplay(name: "Steve")), name: "HelloMyNameIs"))
    }
}
