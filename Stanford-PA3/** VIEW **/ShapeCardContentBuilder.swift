//
//  ShapeCardContentBuilder.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 23..
//

import SwiftUI

struct ShapeCardContentBuilder {
    
    var card: ShapeCardViewModel
    
    init(with card: ShapeCardViewModel) {
        self.card = card
    }
    
    @ViewBuilder func build() -> some View {
        switch card.shape {
        case .diamond:
            Diamond().fill()
        case .rectangle:
            Rectangle().fill()
        case .oval:
            Oval().fill()
        case .circle:
            Circle().fill()
        }
    }
}
