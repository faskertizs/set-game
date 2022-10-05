//
//  CharacterCardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

class CharacterCardViewModel: Identifiable, CardViewModel {
    var card: CharacterCardFeatures.CardType

    required init(with card: CharacterCardFeatures.CardType) {
        self.card = card
    }
    
    var id: UUID { card.id }
    var number: Int { card.number }
    var character: String { card.figure }
    var color: Color { Color.convert(card.color) }
    var attribute: CharacterEmphasis { card.variation }
}
