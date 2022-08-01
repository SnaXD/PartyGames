//
//  MajerGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct MajerGameView: View {
    var game = MajerGame()
    @State var dice: diceFaces = .six
    @State var counter = 0
    @State var timerRunning = false
    @State var hideDices = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        DiceForm(hideDices: $hideDices, game: game, dice: $dice)
                        DiceForm(hideDices: $hideDices, game: game, dice: $dice)
                    }
                    HStack{
                        DiceForm(hideDices: $hideDices, game: game, dice: $dice)
                        DiceForm(hideDices: $hideDices, game: game, dice: $dice)
                    }
                }
                
                    
                VStack{
                    VStack{
                        Button {
                        } label: {
                            Text("Roll the dices (1)")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .frame(width: 225, height: 80, alignment: .center)
                                .onLongPressGesture(minimumDuration: 1) {
                                    dice = game.random()
                                    counter = 0
                                    timerRunning = true
                                }
                        }.buttonStyle(FilledStyle())
                            .shadow(radius: 4)
                        
                        Button {
                            hideDices.toggle()
                        } label: {
                            HStack{
                                Text(hideDices ? "Hide" : "Show")
                                Text("dices")
                            }
                            .font(.system(size: 18))
                            .frame(width: 225)
                        }.buttonStyle(FilledStyle(color: .blue))
                    }
                    
                    
                    Spacer()
                    Text("Time since last roll")
                    Text("\(counter)")
                        .onReceive(timer) { _ in
                            if timerRunning {
                                counter += 1
                            } else {
                                timerRunning = false
                            }
                        }
                        .font(.system(size: 90, weight: .bold))
                    
                }.padding(.vertical, 50)
            }
        }
        .onAppear {
            dice = game.random()
        }
    }
}

struct MajerGameView_Previews: PreviewProvider {
    static var previews: some View {
        MajerGameView()
    }
}


