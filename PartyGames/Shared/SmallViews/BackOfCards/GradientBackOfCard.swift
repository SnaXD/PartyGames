//
//  GradientBackOfCard.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct GradientBackOfCard: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
            }
            Spacer()
        }
        .background(
            AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .cyan, .purple, .orange, .pink]), center: .center)
                .cornerRadius(12)
        )
    }
}

struct GradientBackOfCard_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackOfCard()
    }
}
