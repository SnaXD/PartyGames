//
//  UfoTurnDisplayer.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct UfoTurnDisplayer: View {
    let name: String
    var body: some View {
        //UFO where the name is in the green cone of light
        VStack{
        Image("Ufo")
            .resizable()
            .scaledToFit()
            .overlay {
                Text(name)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.cyan))
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.01)
                    .frame(height: 20)
                    .offset(y: 35)
            }
        }.frame(width: 120, height: 100)
    }
}

struct UfoTurnDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        UfoTurnDisplayer(name: "Steve")
    }
}
