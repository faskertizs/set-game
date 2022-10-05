//
//  CharacterCardContentProvider.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

struct CharacterCardContentProvider: CardContentProvider {
    enum CharacterType {
        case letter
        case digit
        case japanese
    }
        
    var cardFeatures: CharacterCardFeatures

    init(characterType: CharacterType) {
        var characters: [String]
        switch characterType {
            case .letter:
                characters = CharacterFigures.letters
            case .digit:
                characters = CharacterFigures.digits
            case .japanese:
                characters = CharacterFigures.japanese
        }
        
        cardFeatures = CharacterCardFeatures(
            numbers: [1, 2, 3],
            colors: ColorFeature.generateValueArray().randomElements(count: 3),
            figures: characters.randomElements(count: 3),
            variations: CharacterEmphasis.generateValueArray().randomElements(count: 3)
        )
    }
}
