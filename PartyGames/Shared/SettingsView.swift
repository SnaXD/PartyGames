//
//  SettingsView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 08/06/2022.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settings: StandardCustomization
    @State var name = ""
    var body: some View {
        ScrollView{
            LazyVStack{
                HStack{
                    Text("No names needed")
                        .font(.system(size: 8))
                    TextField("Player name:", text: $name)
                    Button {
                        settings.addPlayer(name: name)
                    } label: {
                        Text("Add")
                    }
                }
                if !settings.players.isEmpty {
                    ForEach (settings.players) { player in
                        HStack{
                            Button {
                                settings.removePlayer(who: player)
                            } label: {
                                Image(systemName: "x.circle")
                            }
                            .padding(.trailing)
                            Text(player.name)
                        }

                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView_PreviewsWithBinding()
    }
}

struct SettingsView_PreviewsWithBinding: View {
    @State var settings = StandardCustomization()
    var body: some View {
        SettingsView(settings: $settings)
    }
}

