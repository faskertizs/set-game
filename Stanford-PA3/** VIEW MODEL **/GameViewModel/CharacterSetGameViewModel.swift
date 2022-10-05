//
//  CharacterSetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

class CharacterSetGameViewModel: SetGameViewModel {
    typealias CardContents = CharacterCardFeatures
    typealias CardType = CharacterCard
    typealias CardVM = CharacterCardViewModel
    
    #warning("??? gamePlay and cards cannot be private only internal. I do not understand this 'internal' access control.")
    @Published var gamePlay: SetGamePlay<CharacterCardFeatures>

    required init(with cardFeatures: CharacterCardFeatures) {
        gamePlay = SetGamePlay(with: cardFeatures)
    }
}
