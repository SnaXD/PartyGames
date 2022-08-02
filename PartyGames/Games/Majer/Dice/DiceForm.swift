//
//  DiceForm.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct DiceForm: View {
    @Binding var hideDices: Bool
    var game: DicesGame
    @Binding var dice: diceFaces
    @State var tabbed = false
    var animate: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: animate ? 150 : 120, height: animate ? 150 : 120, alignment: .center)
                .foregroundColor(Color("dicePrimary"))
                .shadow(radius: animate ? 10 : 2)
            
            Circle().frame(width: animate ? 140 : 110, height: animate ? 140 : 110, alignment: .center)
                .foregroundColor(Color("diceCenter"))
            VStack{
                if hideDices {
                    DiceFaceUI(animate: animate, set: game.getDiceFace(dice: dice))
                }
            }.frame(width: animate ? 150 : 120, height: animate ? 150 : 120, alignment: .center)
            if tabbed {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 120, height: 120, alignment: .center)
                    .foregroundColor(Color(uiColor: .systemGray))
                    
            }
        }.onTapGesture {
            tabbed.toggle()
        }
    }
}



struct DiceForm_Previews: PreviewProvider {
    static var previews: some View {
        DiceForm_PreviewsWithBinding()
    }
}

fileprivate struct DiceForm_PreviewsWithBinding: View {
    @State var hideDices = false
    var game = DicesGame()
    @State var dice: diceFaces = .six
    var body: some View {
        DiceForm(hideDices: $hideDices, game: game, dice: $dice, animate: false)
    }
}
