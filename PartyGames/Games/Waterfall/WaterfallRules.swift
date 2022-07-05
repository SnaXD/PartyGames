//
//  WaterfallRules.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct WaterfallRules: View {
    @AppStorage("WaterfallPreferedRulesType") private var ruletype: rulesType = .classic
    @State private var classicRules: [RuleItem] = getClassicRules()
    @State private var xdsRules: [RuleItem] = getXdsRules()
    @State var ruleSize: CGFloat = 14
    var body: some View {
        VStack(spacing: 0){
            Picker("", selection: $ruletype) {
                ForEach(rulesType.allCases, id: \.self){ type in
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
            ScrollView{
                VStack{
                    switch ruletype {
                    case .classic:
                        ForEach(classicRules, id: \.self){ rule in
                            RuleItemsView(rule: rule, textSize: $ruleSize)
                        }.padding(.bottom, 12)
                    case .xDs:
                        withAnimation(.linear(duration: 2)) {
                            ForEach(xdsRules, id: \.self){ rule in
                                RuleItemsView(rule: rule, textSize: $ruleSize)
                            }.padding(.bottom, 12)
                        }
                    }
                    
                }.padding()
            }
        }
    }
}

struct WaterfallRules_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallRules()
    }
}

private enum rulesType: String, CaseIterable {
    case classic, xDs
}

private func getClassicRules() -> [RuleItem]{
    return [RuleItem(card: .ace, title: "aceTitle", rule: "aceRule"),
            RuleItem(card: .two, title: "twoTitle", rule: "twoRule"),
            RuleItem(card: .three, title: "threeTitle", rule: "threeRule"),
            RuleItem(card: .four, title: "fourTitle", rule: "fourRule"),
            RuleItem(card: .five, title: "fiveTitle", rule: "fiveRule"),
            RuleItem(card: .six, title: "sixTitle", rule: "sixRule"),
            RuleItem(card: .seven, title: "sevenTitle", rule: "sevenRule"),
            RuleItem(card: .eight, title: "eightTitle", rule: "eightRule"),
            RuleItem(card: .nine, title: "nineTitle", rule: "nineRule"),
            RuleItem(card: .ten, title: "tenTitle", rule: "tenRule"),
            RuleItem(card: .knight, title: "knightTitle", rule: "knightRule"),
            RuleItem(card: .queen, title: "queenTitle", rule: "queenRule"),
            RuleItem(card: .king, title: "kingTitle", rule: "kingRule")
    ]
}

private func getXdsRules() -> [RuleItem]{
    return [RuleItem(card: .ace, title: "XDsAceTitle", rule: "XDsAceRule"),
            RuleItem(card: .two, title: "XDsTwoTitle", rule: "XDsTwoRule"),
            RuleItem(card: .three, title: "XDsThreeTitle", rule: "XDsThreeRule"),
            RuleItem(card: .four, title: "XDsFourTitle", rule: "XDsFourRule"),
            RuleItem(card: .five, title: "XDsFiveTitle", rule: "XDsFiveRule"),
            RuleItem(card: .six, title: "XDsSixTitle", rule: "XDsSixRule"),
            RuleItem(card: .seven, title: "XDsSevenTitle", rule: "XDsSevenRule"),
            RuleItem(card: .eight, title: "XDsEightTitle", rule: "XDsEightRule"),
            RuleItem(card: .nine, title: "XDsNineTitle", rule: "XDsNineRule"),
            RuleItem(card: .ten, title: "XDsTenTitle", rule: "XDsTenRule"),
            RuleItem(card: .knight, title: "XDsKnightTitle", rule: "XDsKnightRule"),
            RuleItem(card: .queen, title: "XDsQueenTitle", rule: "XDsQueenRule"),
            RuleItem(card: .king, title: "XDsKingTitle", rule: "XDsKingRule")
    ]
}
