//
//  DiceForm.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct DiceForm: View {
    @Binding var hideDices: Bool
    var game: MajerGame
    @Binding var dice: diceFaces
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 120, height: 120, alignment: .center)
                .foregroundColor(Color("dicePrimary"))
                .shadow(radius: 2)
            
            Circle().frame(width: 110, height: 110, alignment: .center)
                .foregroundColor(Color("diceCenter"))
            VStack{
                if hideDices {
                    DiceFaceUI(set: game.getDiceFace(dice: dice))
                }
                
            }.frame(width: 120, height: 120, alignment: .center)
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
    var game = MajerGame()
    @State var dice: diceFaces = .six
    var body: some View {
        DiceForm(hideDices: $hideDices, game: game, dice: $dice)
    }
}
