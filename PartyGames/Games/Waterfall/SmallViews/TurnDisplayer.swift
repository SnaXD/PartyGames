//
//  TurnDisplayer.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 29/06/2022.
//

import SwiftUI

struct TurnDisplayer: View {
    var name: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.red)
            
            Spacer()
            VStack(spacing: 0){
                Text("hello".uppercased())
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 24))
                Text("my_name_is".uppercased())
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 8))
                    .padding(.bottom, 4)
                HStack(spacing: 0){
                    Spacer()
                    Text(name)
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.darkGray))
                        .font(.system(size: 20))
                        .minimumScaleFactor(0.01)
                        .frame(height: 20)
                    Spacer()
                }.background(.white)
                    .padding(.bottom, 7)
            }
        }.frame(width: 100, height: 70)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
                    .shadow(radius: 1)
            )
    }
}

struct TurnDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        TurnDisplayer(name: "Steve")
    }
}
