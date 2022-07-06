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
            .minimumScaleFactor(0.01)
            .frame(height: 20)
            Text(name)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.01)
                .frame(height: 20)
        }
        .padding(8)
        .frame(width: 100, height: 70)
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
