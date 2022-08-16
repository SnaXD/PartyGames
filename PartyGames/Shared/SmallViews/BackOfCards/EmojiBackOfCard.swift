//
//  EmojiBackOfCards.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct EmojiBackOfCard: View {
    let preview: Bool
    
    let emojis = "🥸"
    let stops = [Gradient.Stop(color: .white, location: 0.0),
                 Gradient.Stop(color: .cyan, location: 0.2),
                 Gradient.Stop(color: .red, location: 0.5),
                 Gradient.Stop(color: .purple, location: 0.8),
                 Gradient.Stop(color: .black, location: 1.0)]
    
    
    var body: some View {
            VStack{
                Text(emojis)
                    .font(.system(size: preview ? 50 : 130))
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background{
                        AngularGradient(stops: stops,
                                                  center: UnitPoint(x: 0.50, y: 0.50),
                                                  angle: Angle(degrees: 340.00))
                    }
                //Gets mirrored in app
            }.rotation3DEffect(.degrees(preview ? 0 : 180), axis: (x: 0, y: 1, z: 0))
        
    }
    
}

struct EmojiBackOfCards_Previews: PreviewProvider {
    static var previews: some View {
        EmojiBackOfCard(preview: false)
    }
}
