//
//  SetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

protocol SetGameViewModel: ObservableObject {
    associatedtype CardContents where CardContents: CardFeatures
    associatedtype CardType where CardContents.CardType == CardType
    associatedtype CardVM where CardVM: CardViewModel, CardVM.CardType == CardType

    var gamePlay: SetGamePlay<CardContents> { set get }
    var noMoreHint: Bool { set get}
    
    init(with cardFeatures: CardContents)
}

extension SetGameViewModel {
#warning("??? How can init with a common behavior be provided by the protocol itself?")
//    init(with cardFeatures: CardContents) {
//        gamePlay = SetGamePlay(with: cardFeatures)
//    }
 
    var noMoreHint: Bool {
        get {
            gamePlay.noMoreHint
        }
        set {
            gamePlay.noMoreHint = newValue
        }
    }
    
// MARK: - Data Providers

    var cards: [CardType] {
        gamePlay.cardsOnTable()
    }
 
    func cardViewModels() -> [CardVM] {
        //#warning("!!! I'm sure there is a more compact built-in solution for this with arrays.")
        
        var cardViewModels = [CardVM]()
        
        for card in cards {
            cardViewModels.append(CardVM(with: card))
        }
        
        return cardViewModels
    }
    
    func isAddCardsButtonDisabled() -> Bool {
        return gamePlay.isDeckEmpty()
    }
    
// MARK: - Intents
    
    func choose(card: CardVM) {
        gamePlay.selectCard(id: card.id)
    }
    
    func newGame() {
        gamePlay.startNewGame()
    }
    
    func addCards() {
        gamePlay.addCards()
    }
    
    func showHint() {
        gamePlay.indicateHint()
    }
}
