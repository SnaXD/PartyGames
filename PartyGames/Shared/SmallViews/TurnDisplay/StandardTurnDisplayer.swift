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
        HStack{
            Text(name)
        }
    }
}

struct StandardTurnDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        StandardTurnDisplayer(name: "Steve")
    }
}
