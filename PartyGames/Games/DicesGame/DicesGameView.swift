//
//  DicesGameView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct DicesGameView: View {
    @State var game = DicesGame()
    @State var counter = 0
    @State var timerRunning = false
    @State var hideDices = true
    @State var animateDices = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Text("1")
                        Spacer()
                        DiceForm(hideDices: $hideDices, game: game, dice: $game.dices[0], animate: animateDices)
                        DiceForm(hideDices: $hideDices, game: game, dice: $game.dices[1], animate: animateDices)
                        Spacer()
                        Text("2")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("3")
                        Spacer()
                        DiceForm(hideDices: $hideDices, game: game, dice: $game.dices[2], animate: animateDices)
                        DiceForm(hideDices: $hideDices, game: game, dice: $game.dices[3], animate: animateDices)
                        Spacer()
                        Text("4")
                        Spacer()
                    }
                }
                
                
                VStack{
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 300, height: 100, alignment: .center)
                                .foregroundColor(.green)
                                .shadow(radius: 4)
                            Text("RollTheDices")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .minimumScaleFactor(0.01)
                                .frame(width: 225, height: 50, alignment: .center)
                                .onLongPressGesture(minimumDuration: 0.5) {
                                    withAnimation(.easeOut(duration: 1)) {
                                        animateDices.toggle()
                                    }
                                    animateDices.toggle()
                                    game.RerollDices()
                                    counter = 0
                                    timerRunning = true
                                }
                                .overlay {
                                    Text("HoldFor.5SecToRoll")
                                        .font(.system(size: 12))
                                        .offset(y: 23)
                                }
                        }
                        
                        
                        Button {
                            hideDices.toggle()
                        } label: {
                            HStack{
                                Text(hideDices ? "Hide" : "Show")
                                Text("Dices")
                            }
                            .font(.system(size: 18))
                            .frame(width: 225)
                        }.buttonStyle(FilledStyle(color: .blue))
                    }
                    
                    
                    Spacer()
                    Text("TimeSinceLastRoll")
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
            game.RerollDices()
        }
    }
}

struct DicesGameView_Previews: PreviewProvider {
    static var previews: some View {
        DicesGameView()
    }
}


