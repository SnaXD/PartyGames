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
    var displayed = [QuestionCard]() //List is always max 5 Questions
    
    mutating func Setup(){
        let amountOfQuestions = 88
        let localizedShortedQuestionsKeyword = "Q"
        
        for questionNumber in 1...amountOfQuestions {
            let localizedQuestionTitle = "\(localizedShortedQuestionsKeyword)\(questionNumber)"
            cards.append(QuestionCard(question: localizedQuestionTitle))
        }
        cards.shuffle()
        for _ in 0...4{
            displayed.append(cards[0])
            cards.remove(at: 0)
        }
    }
}
