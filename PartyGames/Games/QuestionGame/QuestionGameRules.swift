//
//  QuestionGameRules.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 17/06/2022.
//

import SwiftUI

struct QuestionGameRules: View {
    @State var ruleSize: CGFloat = 14
    @State private var showPopupForSuccessfulCopy = false
    var body: some View {
        VStack(spacing: 8){
        HStack(spacing: 8){
            Text("tabTwiceToCopy")
                .fontWeight(.light)
                .font(.system(size: 14))
            Spacer()
            Button {
                ruleSize += 2
            } label: {
                Text("+")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            Button {
                ruleSize -= 2
            } label: {
                Text("-")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
        }
        .padding(.top, 16)
        .padding(.horizontal)
            RuleItemsView(rule: RuleItem(card: .ace, title: "QGStepOneTitle", rule: "QGStepOne"), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .two, title: "QGStepTwoTitle", rule: "QGStepTwo"), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .three, title: "QGStepThreeTitle", rule: "QGStepThree"), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .four, title: "QGStepFourTitle", rule: "QGStepFour"), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .five, title: "QGStepFiveTitle", rule: "QGStepFive"), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
        Spacer()
        }.padding()
    }
}

struct QuestionGameRules_Previews: PreviewProvider {
    static var previews: some View {
        QuestionGameRules()
    }
}
