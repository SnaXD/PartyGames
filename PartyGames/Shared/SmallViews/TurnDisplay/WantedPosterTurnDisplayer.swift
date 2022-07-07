//
//  WantedPosterTurnDisplayer.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct WantedPosterTurnDisplayer: View {
    let name: String
    var body: some View {
        VStack{
        Image("WantedPoster")
            .resizable()
            .scaledToFit()
            .overlay {
                Text(name)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.darkGray))
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.01)
                    .frame(width: 100, height: 20)
                    .offset(y: 43)
            }
        }.frame(width: 120, height: 130)
    }
}

struct WantedPosterTurnDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        WantedPosterTurnDisplayer(name: "Steve")
    }
}
