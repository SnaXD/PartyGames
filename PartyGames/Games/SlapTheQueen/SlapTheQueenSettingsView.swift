//
//  SlapTheQueenSettingsView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 17/08/2022.
//

import SwiftUI

struct SlapTheQueenSettingsView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                SettingsView(
                HStack{
                    Text("Card_size")
                        .padding(.trailing, 42)
                    Spacer()
                    Picker("", selection: $settings.inspectCardSize) {
                        ForEach(WaterfallCustomization.inspectCardSizes.allCases, id: \.self) { value in
                            Text(LocalizedStringKey(value.rawValue))
                                .tag(value)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct SlapTheQueenSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SlapTheQueenSettingsView()
    }
}
