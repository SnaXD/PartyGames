//
//  FilledB.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 14/06/2022.
//

import SwiftUI

struct FilledStyle: ButtonStyle {
    var color: Color = .green
    public func makeBody(configuration: FilledStyle.Configuration) -> some View {
        Filled(configuration: configuration, color: color)
    }
    
    struct Filled: View {
        let configuration: FilledStyle.Configuration
        let color: Color
        var body: some View {
            return configuration.label
                .foregroundColor(.white)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).fill(color))
                .shadow(radius: 1)
                .opacity(configuration.isPressed ? 0.5 : 1.0)
        }
    }
}


struct Filled_Previews: PreviewProvider {
    static var previews: some View {
        Button {
        } label: {
            Text("Cool Button")
        }.buttonStyle(FilledStyle())
        
    }
}
