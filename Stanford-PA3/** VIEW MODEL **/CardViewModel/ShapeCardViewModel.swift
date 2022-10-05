//
//  ShapeCardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

class ShapeCardViewModel: Identifiable {
    var card: ShapeCardFeatures.CardType
    
    init(with card: ShapeCardFeatures.CardType) {
        self.card = card
    }
    
    var id: UUID { card.id }
    var number: Int { card.number }
    var color: Color { Color.convert(card.color) }
    var shape: ShapeFeature { card.figure }
    var shading: ShadingFeature { card.variation }

    var isSelected: Bool { card.isSelected }
    var isInSet: Bool { card.isInSet }
    var isInMismatch: Bool { card.isInMismatch }
}
