//
//  CardView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct QuestionCardView: View {
    let card: QuestionCard
    
    var body: some View {
        VStack {
            VStack {
                Text("QUIZ NIGHT")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Divider()
                Spacer()
                Text(card.question)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .padding()
        .frame(width: 300, height: 400)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.black)
        )
    }
}
struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(card: QuestionCard(question: "tttt", color: .green))
    }
}
