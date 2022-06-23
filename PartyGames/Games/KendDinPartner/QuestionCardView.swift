//
//  CardView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct QuestionCardView: View {
    let randomColor: [Color] = [.green, .blue, .red, .brown, .gray, .cyan, .indigo, .orange, .purple, .pink, .mint]
    let card: String
    
    var body: some View {
        VStack {
            VStack {
                Text("quesionsGame")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Divider()
                Spacer()
                Text(LocalizedStringKey(card))
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .padding()
        .frame(width: 380, height: 480)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(randomColor.randomElement())
        )
    }
}
struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(card: "A - b - e - c - d- fuck det - abekattemissekattekatestrofalkatastrofe")
    }
}
