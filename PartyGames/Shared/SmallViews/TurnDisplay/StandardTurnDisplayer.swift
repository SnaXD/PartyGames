//
//  StandardTurnDisplayer.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 05/07/2022.
//

import SwiftUI

struct StandardTurnDisplayer: View {
    let name: String
    var body: some View {
        VStack{
            Text("Its your turn")
            Text(name)
                .fontWeight(.semibold)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(uiColor: .systemGray3)))
    }
}

struct StandardTurnDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        StandardTurnDisplayer(name: "Steve")
    }
}
