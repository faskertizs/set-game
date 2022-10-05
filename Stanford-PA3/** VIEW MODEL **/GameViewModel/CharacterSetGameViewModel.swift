//
//  CharacterSetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Combine

class CharacterSetGameViewModel: SetGameViewModel, ObservableObject {
    #warning("??? gamePlay and cards cannot be private only internal. I do not understand this 'internal' access control.")
    @Published var gamePlay: SetGamePlay<CharacterCardFeatures>
    var cards: [CharacterCardFeatures.CardType] {
        gamePlay.cardsOnTable()
    }
    
    init(with cardFeatures: CharacterCardFeatures) {
        gamePlay = SetGamePlay(with: cardFeatures)
    }
    
    func cardViewModels() -> [CharacterCardViewModel] {
        #warning("!!! I'm sure there is a more compact built-in solution for this.")
        
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
    
    func choose(card: CharacterCardViewModel) {
        gamePlay.chooseCard(id: card.id)
    }
    
    func newGame() {
        gamePlay.startNewGame()
    }
    
    func addCards() {
        gamePlay.addCards()
    }
}
