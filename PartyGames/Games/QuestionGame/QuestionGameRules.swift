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
            RuleItemsView(rule: RuleItem(card: .ace, title: "QGStepOneTitle", rule: "QGStepOne", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .two, title: "QGStepTwoTitle", rule: "QGStepTwo", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .three, title: "QGStepThreeTitle", rule: "QGStepThree", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .four, title: "QGStepFourTitle", rule: "QGStepFour", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .five, title: "QGStepFiveTitle", rule: "QGStepFive", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            Spacer()
        }.padding()
            .popup(isPresented: $showPopupForSuccessfulCopy, type: .toast, position: .bottom, animation: .easeInOut(duration: 0.5), autohideIn: 1.5, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {
                HStack{
                    Text("successfullyCopyed")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color(uiColor: .systemGray5))
                        )
                        .padding(.bottom, 32)
                }
            }
    }
}

struct QuestionGameRules_Previews: PreviewProvider {
    static var previews: some View {
        QuestionGameRules()
    }
}
