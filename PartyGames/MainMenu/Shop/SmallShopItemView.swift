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
                ShopItemFrame()
                
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
