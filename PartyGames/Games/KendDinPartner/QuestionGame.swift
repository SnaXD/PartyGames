//
//  QuestionGame.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 17/06/2022.
//

import Foundation
import SwiftUI

struct QuestionGame: QuestionCardStack {
    var topCardOffset: CGSize = .zero
    var activeCard: QuestionCard? = nil
    var cards: [QuestionCard] = [QuestionCard]()
    
    @ObservedObject var customizedSettings: StandardCustomization = StandardCustomization.Shared
    var usedDecks = [QuestionCard]()
    @State var displayed = [QuestionCard]() //List is always max 5 Questions
    
    
    mutating func Setup(){
        let amountOfQuestions = 10
        let localizedShortedQuestionsKeyword = "q"
        
        for questionNumber in 1...amountOfQuestions {
            let localizedQuestionTitle = "\(localizedShortedQuestionsKeyword) \(questionNumber)"
            cards.append(QuestionCard(question: localizedQuestionTitle))
        }
        cards.shuffle()
    }
}
