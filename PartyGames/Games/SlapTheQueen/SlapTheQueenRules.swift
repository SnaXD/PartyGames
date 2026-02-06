//
//  SlapTheQueenRules.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 07/06/2022.
//

import SwiftUI

struct SlapTheQueenRules: View {
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
            RuleItemsView(rule: RuleItem(card: .ace, title: "Goal", rule: "STQGoalDescription", useCardType: false), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .ace, title: "[10]", rule: "STQRule0-10Rule", useCardType: true), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .jack, title: "", rule: "STQRuleJackRule", useCardType: true), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .queen, title: "", rule: "STQRuleQueenRule", useCardType: true), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            RuleItemsView(rule: RuleItem(card: .king, title: "", rule: "STQRuleKingRule", useCardType: true), showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                .padding(.bottom, 12)
            Spacer()
        }.padding()
            .popup(isPresented: $showPopupForSuccessfulCopy) {
                HStack{
                    Text("successfullyCopyed")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color(uiColor: .systemGray5))
                        )
                        .padding(.bottom, 32)
                }
            } customize: {
                $0
                    .type(.toast)
                    .position(.bottom)
                    .animation(.easeInOut(duration: 0.5))
                    .autohideIn(1.5)
                    .dragToDismiss(true)
                    .closeOnTap(true)
                    .closeOnTapOutside(true)
            }
          
    }
    
}

struct SlapTheQueenRules_Previews: PreviewProvider {
    static var previews: some View {
        SlapTheQueenRules()
    }
}
