//
//  WaterfallSettingsView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 30/06/2022.
//

import SwiftUI

struct WaterfallSettingsView: View {
    @ObservedObject var settings: WaterfallCustomization
    @State var name = ""
    fileprivate func KeepCardInHandPickerItem(_ type: CardTypes) -> some View {
        return Text(type.rawValue)
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
                    Picker("", selection: $settings.includeJoker) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }.frame(width: 150)
                        .pickerStyle(.segmented)
                }.padding(.top, 16)
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
                HStack{
                    Text("CardsToKeepInHand")
                    Spacer()
                }
                .padding(.top, 16)
                VStack{
                    HStack{
                        ForEach(settings.getHalfOfCardTypes(part: .first), id: \.self) { type in
                            KeepCardInHandPickerItem(type)
                        }
                    }
                    HStack{
                        ForEach(settings.getHalfOfCardTypes(part: .secound), id: \.self) { type in
                            KeepCardInHandPickerItem(type)
                        }
                    }
                    HStack{
                        ForEach(settings.getHalfOfCardTypes(part: .third), id: \.self) { type in
                            KeepCardInHandPickerItem(type)
                        }
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
