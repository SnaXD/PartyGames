//
//  ShopView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView(){
            VStack(spacing: 12){
                Text("Cosmetics")
                    .bold()
                    .font(.system(size: 25))
                ForEach(turnDisplay.allCases) { item in
                    SmallShopItemView(item: getViewForTurnDisplay(display: item), name: <#T##String#>)
                }
                ScrollView(.horizontal){
//                    SmallShopItemView(item: )
                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

enum turnDisplay: CaseIterable {
    case myNameIs
}

func getViewForTurnDisplay(display: turnDisplay) -> AnyView{
    switch display {
    case .myNameIs:
        return AnyView(MyNameIsTurnDisplay(name: "Steve"))
    }
}
