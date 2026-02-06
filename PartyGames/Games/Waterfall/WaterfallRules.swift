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
    @State private var showPopupForSuccessfulCopy = false
    @State private var generatedRule: String = ""
    @State private var generatedCategory: String = ""
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
                            RuleItemsView(rule: rule, showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                        }.padding(.bottom, 12)
                    case .xDs:
                        withAnimation(.linear(duration: 2)) {
                            ForEach(xdsRules, id: \.self){ rule in
                                RuleItemsView(rule: rule, showPopup: $showPopupForSuccessfulCopy, textSize: $ruleSize)
                            }.padding(.bottom, 12)
                        }
                    }
                    Button {
                        generatedRule = ruleGenerator(lastRule: generatedRule)
                    } label: {
                        Text("GenerateRule")
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(Color(uiColor: .systemBlue)))
                        
                    }
                    Text(LocalizedStringKey(generatedRule))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 42)
                        .padding(4)
                        .background(RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .systemGray5)))
                    
                    Button {
                        generatedCategory = categoryGenerator(lastCategory: generatedCategory)
                    } label: {
                        Text("GenerateCategory")
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(Color(uiColor: .systemBlue)))
                    }
                    .padding(.top, 8)
                    Text(LocalizedStringKey(generatedCategory))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 42)
                        .padding(4)
                        .background(RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .systemGray5)))
                    
                    
                    
                }.padding()
            }
        }
        .popup(isPresented: $showPopupForSuccessfulCopy){
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
                .closeOnTapOutside(true)
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
    return [RuleItem(card: .ace, title: "aceTitle", rule: "aceRule", useCardType: true),
            RuleItem(card: .two, title: "twoTitle", rule: "twoRule", useCardType: true),
            RuleItem(card: .three, title: "threeTitle", rule: "threeRule", useCardType: true),
            RuleItem(card: .four, title: "fourTitle", rule: "fourRule", useCardType: true),
            RuleItem(card: .five, title: "fiveTitle", rule: "fiveRule", useCardType: true),
            RuleItem(card: .six, title: "sixTitle", rule: "sixRule", useCardType: true),
            RuleItem(card: .seven, title: "sevenTitle", rule: "sevenRule", useCardType: true),
            RuleItem(card: .eight, title: "eightTitle", rule: "eightRule", useCardType: true),
            RuleItem(card: .nine, title: "nineTitle", rule: "nineRule", useCardType: true),
            RuleItem(card: .ten, title: "tenTitle", rule: "tenRule", useCardType: true),
            RuleItem(card: .jack, title: "knightTitle", rule: "knightRule", useCardType: true),
            RuleItem(card: .queen, title: "queenTitle", rule: "queenRule", useCardType: true),
            RuleItem(card: .king, title: "kingTitle", rule: "kingRule", useCardType: true)
    ]
}

private func getXdsRules() -> [RuleItem]{
    return [RuleItem(card: .ace, title: "XDsAceTitle", rule: "XDsAceRule", useCardType: true),
            RuleItem(card: .two, title: "XDsTwoTitle", rule: "XDsTwoRule", useCardType: true),
            RuleItem(card: .three, title: "XDsThreeTitle", rule: "XDsThreeRule", useCardType: true),
            RuleItem(card: .four, title: "XDsFourTitle", rule: "XDsFourRule", useCardType: true),
            RuleItem(card: .five, title: "XDsFiveTitle", rule: "XDsFiveRule", useCardType: true),
            RuleItem(card: .six, title: "XDsSixTitle", rule: "XDsSixRule", useCardType: true),
            RuleItem(card: .seven, title: "XDsSevenTitle", rule: "XDsSevenRule", useCardType: true),
            RuleItem(card: .eight, title: "XDsEightTitle", rule: "XDsEightRule", useCardType: true),
            RuleItem(card: .nine, title: "XDsNineTitle", rule: "XDsNineRule", useCardType: true),
            RuleItem(card: .ten, title: "XDsTenTitle", rule: "XDsTenRule", useCardType: true),
            RuleItem(card: .jack, title: "XDsKnightTitle", rule: "XDsKnightRule", useCardType: true),
            RuleItem(card: .queen, title: "XDsQueenTitle", rule: "XDsQueenRule", useCardType: true),
            RuleItem(card: .king, title: "XDsKingTitle", rule: "XDsKingRule", useCardType: true)
    ]
}

private func ruleGenerator(lastRule: String) -> String {
    let rules: [String] = ["AIsDrinkingBuddyWithB", "ChangeNameWithThePersonOnTheLeft", "AGotToDrink2SipsWheneverBDrinks", "AISOnlyAllowedToSpeakWhenTheyAreDirectlyTalkedTo", "AGotToRaiseTheirHandBeforeTheyAreAllowedToSpeak", "AGotToSayImNotReallyThatThirstyBeforeDrinking", "AIsOnlyAllowedToDrinkWhenTheyStandUp", "AWillSplitAllHisSipsWithB", "AGotToSpeakLikeYoda"]
    var rule = rules.randomElement()!
    while true {
        if rule != lastRule {
            break
        }
        rule = rules.randomElement()!
    }
    
    return rule
}

private func categoryGenerator(lastCategory: String) -> String {
    let categorys: [String] = ["ComputerManufactors", "Beers", "Drinks", "Contrys", "Continents", "Capitals", "MakeupBrands", "WaysToHomercide", "DumbWaysToDie", "Numbers0-20", "CarManifactors", "KindsOfSoda", "IphoneModels", "ChampionsLeagueTeams", "LeagueOfLegendsCharacters", "SongsEdSheeranSing", "SongsEminemRap", "WordsInShapeOfYou", "ShoeBrands", "ActiveSports", "KeysOnAKeyboard"]
    var category = categorys.randomElement()!
    while true {
        if category != lastCategory {
            break
        }
        category = categorys.randomElement()!
    }
    return category
}
