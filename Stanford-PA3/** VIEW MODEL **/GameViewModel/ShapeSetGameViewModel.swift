//
//  ShapeSetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 17..
//

import SwiftUI

class ShapeSetGameViewModel: SetGameViewModel, ObservableObject {
    //#warning("??? gamePlay and cards cannot be private only internal. I do not understand this 'internal' access control.")
    @Published var gamePlay: SetGamePlay<ShapeCardFeatures>
    var cards: [ShapeCardFeatures.CardType] {
        gamePlay.cardsOnTable()
    }

    init(with cardFeatures: ShapeCardFeatures) {
        gamePlay = SetGamePlay(with: cardFeatures)
    }
    
    func cardViewModels() -> [ShapeCardViewModel] {
        //#warning("!!! I'm sure there is a more compact built-in solution for this with arrays.")
        
        var cardViewModels = [CardViewModel]()
        
        for card in cards {
            cardViewModels.append(CardViewModel(with: card))
        }
        
        return cardViewModels
    }
    
    func isAddCardsButtonDisabled() -> Bool {
        return gamePlay.isDeckEmpty()
    }
    
// MARK: - Intents
    
    func choose(card: ShapeCardViewModel) {
        gamePlay.chooseCard(id: card.id)
    }
    
    func newGame() {
        gamePlay.startNewGame()
    }
    
    func addCards() {
        gamePlay.addCards()
    }
}
