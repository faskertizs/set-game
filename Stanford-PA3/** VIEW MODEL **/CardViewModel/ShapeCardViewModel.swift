//
//  ShapeCardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

class ShapeCardViewModel: Identifiable, CardViewModel {
    var card: ShapeCardFeatures.CardType
    
    required init(with card: ShapeCardFeatures.CardType) {
        self.card = card
    }
    
    var id: UUID { card.id }
    var number: Int { card.number }
    var shape: ShapeFeature { card.figure }
    var color: Color { Color.convert(card.color) }
    var shading: ShadingFeature { card.variation }
}
