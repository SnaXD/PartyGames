//
//  ColorFullCircle.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct ColorFullCircle: View {
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                Spacer()
                HStack{
                    Spacer()
                }
            }
            .overlay {
                ZStack{
                    Circle()
                        .stroke(.black, lineWidth: 1)
                    Circle()
                        .fill(
                            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360))
                        )
                    
                    Circle().frame(width: proxy.size.height / 3.5, height: proxy.size.height / 3.5, alignment: .center)
                        .foregroundColor(Color(uiColor: .systemGray2))
                }
                .padding(16)
            }
        }
    }
}

struct ColorFullCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorFullCircle()
    }
}
