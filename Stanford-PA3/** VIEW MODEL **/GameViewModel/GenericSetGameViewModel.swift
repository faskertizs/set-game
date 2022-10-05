//
//  GenericSetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 25..
//

import SwiftUI

//class GenericSetGameViewModel<CardContents>: SetGameViewModel, ObservableObject where CardContents: CardFeatures {
//
//    @Published var gamePlay: SetGamePlay<CardContents>
//    var cards: [CardContents.CardType] {
//        gamePlay.cardsOnTable()
//    }
//
//    init(with cardFeatures: CardContents) {
//        gamePlay = SetGamePlay(with: cardFeatures)
//    }
//
//    func cardViewModels() -> [CardVM] where CardVM: SetGameViewModel.CardViewModel {
//
//        var cardViewModels = [SetGameViewModel.CardViewModel]()
//
//        for card in cards {
//            cardViewModels.append(CardViewModel(with: card))
//        }
//
//        return cardViewModels
//    }
//
//    func isAddCardsButtonDisabled() -> Bool {
//        return gamePlay.isDeckEmpty()
//    }
//
//// MARK: - Intents
//
//    func choose(card: ShapeCardViewModel) {
//        gamePlay.chooseCard(id: card.id)
//    }
//
//    func newGame() {
//        gamePlay.startNewGame()
//    }
//
//    func addCards() {
//        gamePlay.addCards()
//    }
//}
