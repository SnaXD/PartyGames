//
//  ShopItemFrame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct ShopItemFrame: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(.tint, lineWidth: 3)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 1)
            .frame(width: 225, height: 175)
    }
}

struct ShopItemFrame_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemFrame()
    }
}
