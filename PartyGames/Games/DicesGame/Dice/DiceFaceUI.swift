//
//  DiceView.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 01/08/2022.
//

import SwiftUI

struct DiceFaceUI: View {
    var animate = false
    let set: Array<Array<Int>>
    let columns = [
        GridItem(.fixed(30), spacing: 0),
        GridItem(.fixed(30), spacing: 0),
        GridItem(.fixed(30), spacing: 0)]
    var body: some View {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(0..<3) { id in
                    Circle()
                        .fill(.black)
                        .opacity(set[0][id] == 1 ? 1 : 0)
                        .frame(height: 30)
                }
                ForEach(0..<3) { id in
                    Circle()
                        .fill(.black)
                        .opacity(set[1][id] == 1 ? 1 : 0)
                        .frame(height: 30)
                }
                ForEach(0..<3) { id in
                    Circle()
                        .fill(.black)
                        .opacity(set[2][id] == 1 ? 1 : 0)
                        .frame(height: 30)
                }
            }
            .frame(width: animate ? 130 : 100, height: animate ? 130: 100)
            .scaleEffect(animate ? 1.7 : 1, anchor: .center)
            
        }
}
    struct DiceFaceUI_Previews: PreviewProvider {
        static var previews: some View {
            DiceFaceUI(set: [[0,0,1], [0,1,0], [1,0,0]])
        }
    }
