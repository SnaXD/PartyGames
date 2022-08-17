//
//  SettingsView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 08/06/2022.
//

import SwiftUI

struct SlapTheQueenSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var settings: StandardCustomization
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
            }
            LazyVStack{
                Divider()
                    .padding(.vertical, 8)
                Slider(value: $settings.animationTime, in: Double(0.0)...2, step: 0.1)
                HStack(alignment: .top){
                    Text("0")
                    Spacer()
                    Text("Animationtime")
                    Spacer()
                    Text("2")
                }.font(.system(size: 10))
                Divider()
                    .padding(.vertical, 8)
            }
            LazyVStack{
                HStack{
                    Text("Infinity_cards")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .italic()
                    Spacer()
                }
                .padding(.top, 12)
                Picker("Infinity_cards", selection: $settings.infinityCards) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(.segmented)
                if $settings.infinityCards.wrappedValue == false {
                    HStack{
                        Text("Amount_of_decks")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .italic()
                        Spacer()
                        TextField("Input", text: $settings.amountOfDecks)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .frame(width: 100, height: 32, alignment: .center)
                            .background(colorScheme == .dark ? .gray : .black)
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(8)
                    }
                    .padding(.top, 24)
                    
                    
                }
            }
            LazyVStack{
                HStack{
                    Text("Card_size")
                        .fontWeight(.semibold)
                        .padding(.trailing, 42)
                    Spacer()
                    Picker("", selection: $settings.inspectCardSize) {
                        ForEach(StandardCustomization.inspectCardSizes.allCases, id: \.self) { value in
                            Text(LocalizedStringKey(value.rawValue))
                                .tag(value)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
            }
        }
        .padding(.horizontal)
        .background(Color(UIColor.systemGray6))
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
        SlapTheQueenSettingsView(settings: settings)
    }
}

