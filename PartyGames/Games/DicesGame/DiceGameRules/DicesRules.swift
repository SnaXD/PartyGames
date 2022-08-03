//
//  DicesRules.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 02/08/2022.
//

import SwiftUI

struct DicesRules: View {
    @AppStorage("DiceGamePreferedRulesType") private var ruletype: DiceGamesRuleType = .Snyd
    @State private var MeyerRules: [RuleItem] = getMeyerRules()
    @State private var snydRules: [RuleItem] = getSnydRules()
    @State var ruleSize: CGFloat = 14
    @State private var showPopupForSuccessfulCopy = false
    var body: some View {
        VStack(spacing: 0){
            Picker("", selection: $ruletype) {
                ForEach(DiceGamesRuleType.allCases, id: \.self){ type in
                    Text(LocalizedStringKey(type.rawValue))
                        .tag(type)
                }
            }.pickerStyle(.segmented)
                .padding(.top, 4)
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
            ScrollView(.vertical){
                VStack{
                    switch ruletype {
                    case .Meyer:
                        ForEach(getMeyerRules(), id: \.self){ rule in
                            RuleItemsView(rule: rule, showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                        }.padding(.bottom, 12)
                    case .Snyd:
                        withAnimation(.linear(duration: 2)) {
                            ForEach(getSnydRules(), id: \.self){ rule in
                                RuleItemsView(rule: rule, showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                            }.padding(.bottom, 12)
                        }
                    }
                }.padding()
            }
        }
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

struct DicesRules_Previews: PreviewProvider {
    static var previews: some View {
        DicesRules()
    }
}

private enum DiceGamesRuleType: String, CaseIterable {
    case Meyer, Snyd
}

private func getMeyerRules() -> [RuleItem]{
    return [RuleItem(card: .ace, title: "MeyerRule1Title", rule: "MeyerRule1", useCardType: false),
            RuleItem(card: .ace, title: "MeyerRule2Title", rule: "MeyerRule2", useCardType: false),
            RuleItem(card: .ace, title: "MeyerRule3Title", rule: "MeyerRule3", useCardType: false),
            RuleItem(card: .ace, title: "MeyerRule4Title", rule: "MeyerRule4", useCardType: false),
            RuleItem(card: .ace, title: "MeyerRule5Title", rule: "MeyerRule5", useCardType: false),
    ]
}

private func getSnydRules() -> [RuleItem]{
    return [RuleItem(card: .ace, title: "SnydRule1Title", rule: "SnydRule1", useCardType: false),
            RuleItem(card: .ace, title: "SnydRule2Title", rule: "SnydRule2", useCardType: false),
            RuleItem(card: .ace, title: "SnydRule3Title", rule: "SnydRule3", useCardType: false),
            RuleItem(card: .ace, title: "SnydRule4Title", rule: "SnydRule4", useCardType: false),
            RuleItem(card: .ace, title: "SnydRule5Title", rule: "SnydRule5", useCardType: false),
    ]
}
