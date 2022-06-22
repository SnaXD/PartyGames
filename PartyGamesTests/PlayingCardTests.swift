//
//  PartyGamesTests.swift
//  PartyGamesTests
//
//  Created by Jonathan T. Nielsen on 22/06/2022.
//

import XCTest
@testable import PartyGames

class PlayingCardTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardsGetChanged() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.SetupGame()
        
        let firstCard = slapTheQueenGame.displayed.first
        slapTheQueenGame.getNewCard()
        let secoundCard = slapTheQueenGame.displayed.first
        XCTAssertNotEqual(firstCard, secoundCard, "A new card isnt showed")
    }
    
    func testCardsGoBackACard() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.customizedSettings.infinityCards = true
        slapTheQueenGame.SetupGame()
        
        let firstCard = slapTheQueenGame.displayed.first
        slapTheQueenGame.getNewCard()
        let secoundCard = slapTheQueenGame.displayed.first
        slapTheQueenGame.getNewCard()
        slapTheQueenGame.getLastCard()
        if slapTheQueenGame.displayed.first == secoundCard {
            slapTheQueenGame.getLastCard()
            if slapTheQueenGame.displayed.count == 5{
                XCTAssertEqual(slapTheQueenGame.displayed.first, firstCard, "Go to last card dosnt show the right card")
            } else {
                XCTFail("Displayed are losing cards")
            }
        } else {
            XCTFail("Did not revice the last card")
        }
    }
    
    func testCardsGetShuffled() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.SetupGame()
        
        let cards = slapTheQueenGame.usedDecks
        slapTheQueenGame.SetupGame()
        XCTAssertNotEqual(cards, slapTheQueenGame.usedDecks, "Cards dosnt get shuffled")
    }
    
    func testUsedDecksGetsFilledWithTheRightAmountOfDecks() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.customizedSettings.amountOfDecks = "2"
        slapTheQueenGame.customizedSettings.includeJoker = true
        slapTheQueenGame.SetupGame()
        
        let correctAmountOfCards = 56 * (Int(slapTheQueenGame.customizedSettings.amountOfDecks) ?? -1)
        XCTAssertEqual(slapTheQueenGame.count(), correctAmountOfCards, "Theres \(slapTheQueenGame.count()) of cards in the deck with jokers. But suppost to be: \(correctAmountOfCards)")
    }
    
    func testGameIsWithoutJokers() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.customizedSettings.includeJoker = false
        slapTheQueenGame.SetupGame()
        
        XCTAssertEqual(slapTheQueenGame.count(), 52, "Jokers Didnt get removed from the deck")
    }
    
    func testDisplayedDontLooseCards() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.SetupGame()
        
        for _ in 0...10 {
            slapTheQueenGame.getNewCard()
        }
        XCTAssertEqual(slapTheQueenGame.displayed.count, 5, "New cards are not getting added to the display")
    }
    
    func testInfinityCardsCanBeToggled() {
        var slapTheQueenGame = SlapTheQueenGame()
        slapTheQueenGame.SetupGame()
        for _ in 0...51 {
            slapTheQueenGame.getNewCard()
        }
        if (slapTheQueenGame.usedDecks.isEmpty){
            slapTheQueenGame.customizedSettings.infinityCards = true
            slapTheQueenGame.SetupGame()
            for _ in 0...51 {
                slapTheQueenGame.getNewCard()
            }
            XCTAssertEqual(slapTheQueenGame.count(), 52, "Infinity cards dosnt work")
        } else {
            XCTFail("Too many cards in the deck")
        }
    }
}
