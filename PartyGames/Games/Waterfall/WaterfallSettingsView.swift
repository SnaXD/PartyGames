//
//  WaterfallSettingsView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI
import WrappingStack

struct WaterfallSettingsView: View {
    @ObservedObject var settings: WaterfallCustomization
    @State var name = ""
    var body: some View {
        ScrollView{
            LazyVStack{
                HStack{
                    Text("Settings")
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                        .padding(.top, 32)
                    Spacer()
                }
                .padding(.bottom, 16)
                HStack{
                    Text("No_names_needed")
                        .font(.system(size: 10))
                        .italic()
                    Spacer()
                }
                HStack{
                    TextField("Player_name", text: $name)
                    Button {
                        if name != "" {
                            settings.addPlayer(name: name)
                            name = ""
                        }
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
                        .padding(.vertical, 4)
                    }
                }
                HStack{
                    Text("PlayWithJoker")
                    Spacer()
                    Picker("Infinity_cards", selection: $settings.includeJoker) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }.frame(width: 150)
                    .pickerStyle(.segmented)
                }.padding(.top, 16)
                
                HStack{
                    Text("CardsToKeepInHand")
                    Spacer()
                }
                .padding(.top, 16)
                WrappingHStack(id: \.self){
                    ForEach(CardTypes.allCases, id: \.self){ type in
                        Text(type.rawValue)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .padding()
                            .background(settings.cardsToKeep.contains(type) ? .green : .red)
                            .cornerRadius(8)
                            .onTapGesture {
                                if settings.cardsToKeep.contains(type) {
                                    settings.cardsToKeep.removeAll { typeToKeep in
                                        typeToKeep == type
                                    }
                                } else {
                                    self.settings.cardsToKeep.append(type)
                                }
                            }
                            .padding(4)
                    }
                }
            }
        }.padding(.horizontal, 8)
    }
}

struct WaterfallSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallSettingsView(settings: WaterfallGame().customizedSettings)
    }
}
