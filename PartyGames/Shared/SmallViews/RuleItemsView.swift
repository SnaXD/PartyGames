//
//  RuleItems.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 05/07/2022.
//

import SwiftUI
import UniformTypeIdentifiers

struct RuleItemsView: View {
    var rule: RuleItem
    @Binding var showPopup: Bool
    @Binding var textSize: CGFloat
    var body: some View {
        VStack{
        HStack{
            Text("[\(rule.card.rawValue)] -")
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            Text(LocalizedStringKey(rule.title))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                
                Spacer()
        }
            Divider()
            HStack{
                Text(LocalizedStringKey(rule.rule))
                    .font(.system(size: textSize))
            }
        }
        .padding()
        .onTapGesture(count: 2) {
            let localized = NSLocalizedString(rule.rule, comment: "")
            UIPasteboard.general.setValue(localized,
                    forPasteboardType: UTType.plainText.identifier)
            showPopup.toggle()
            }
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(uiColor: .systemGray3))
                .shadow(radius: 2)
        }
    }
}

private struct RuleItems_Previews: PreviewProvider {
    static var previews: some View {
        RuleItems_PreviewsWithBinding()
    }
}

private struct RuleItems_PreviewsWithBinding: View {
    @State var size: CGFloat = 14
    @State var showPopup: Bool = false
    var body: some View {
        RuleItemsView(rule: RuleItem(card: .king, title: "King", rule: "You're allowed to rule everything in the game but not change the game. This line is just to make the view a little longer to make it look like real data and make styling more easely done"), showPopup: $showPopup, textSize: $size)
            .popup(isPresented: $showPopup, type: .toast, position: .bottom, animation: .easeInOut(duration: 0.2), autohideIn: 1, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {
                Text("successfullyCopyed")
            }
    }
}

struct RuleItem: Hashable{
    var card: CardTypes
    var title: String
    var rule: String
}
