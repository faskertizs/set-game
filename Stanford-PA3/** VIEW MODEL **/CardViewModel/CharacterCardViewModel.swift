//
//  CharacterCardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

class CharacterCardViewModel: Identifiable {
    var card: CharacterCardFeatures.CardType

    init(with card: CharacterCardFeatures.CardType) {
        self.card = card
    }
    
    var id: UUID { card.id }
    var number: Int { card.number }
    var character: String { card.figure }
    var attribute: CharacterEmphasis { card.variation }
    var color: Color { Color.convert(card.color) }
    
    var isSelected: Bool { card.isSelected }
    var isInSet: Bool { card.isInSet }
    var isInMismatch: Bool { card.isInMismatch }
}
