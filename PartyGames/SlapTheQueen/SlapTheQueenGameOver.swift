//
//  SlapTheQueenGameOver.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 14/06/2022.
//

import SwiftUI

struct SlapTheQueenGameOver: View {
    let game: SlapTheQueenGame
    var body: some View {
        VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .interactiveDismissDisabled()
    }
    
    func close(){
        EnvironmentValues().dismiss()
    }
}

struct SlapTheQueenGameOver_Previews: PreviewProvider {
    static var previews: some View {
        SlapTheQueenGameOver(game: SlapTheQueenGame())
    }
}
