//
//  SmallShopItemView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct SmallShopItemView: View {
    let item: AnyView
    let name: String
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.tint, lineWidth: 2)
                    .shadow(radius: 2)
                    .frame(width: 225, height: 175)
                
                item
            }
            Text(name)
        }
    }
}

struct SmallShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        SmallShopItemView(item: AnyView(MyNameIsTurnDisplay(name: "Steve")), name: "HELLO, MY NAME IS")
    }
}
