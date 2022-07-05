//
//  WaterfallRules.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 23/06/2022.
//

import SwiftUI

struct WaterfallRules: View {
    @State private var ruletype: rulesType = .classic
    var body: some View {
        VStack{
            Picker("", selection: $ruletype) {
                ForEach(rulesType.allCases, id: \.self){ type in
                    Text(LocalizedStringKey(type.rawValue))
                        .tag(type)
                }
            }.pickerStyle(.segmented)
            ScrollView{
                
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
    case classic, xDs, custom
}
