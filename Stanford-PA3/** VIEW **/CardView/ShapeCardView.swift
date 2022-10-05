//
//  ShapeCardView.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import SwiftUI

struct ShapeCardView: View {
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let borderLineWidth: CGFloat = 3.0
        static let symbolAspectRatio: CGFloat = 2
        static let contentHorizontalPaddingScale: CGFloat = 0.2
        static let symbolStrokeLineWidth: CGFloat = 3
        static let shadedSymbolOpacity: Double = 0.3
        static let extraPaddingScaleForCardsInSet: CGFloat = 0.2
    }
    
    private var card: ShapeCardViewModel

    init(for card: ShapeCardViewModel) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            let extraPadding = card.isInSet ? geometry.size.width * DrawingConstants.extraPaddingScaleForCardsInSet : 0
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(card.isInMismatch ? .black : (card.isSelected ? .yellow : (card.card.isHinted ? .gray : .white)))
                shape.strokeBorder(lineWidth: DrawingConstants.borderLineWidth).foregroundColor(.gray)
                
                cardContent()
                    .padding(geometry.size.width * DrawingConstants.contentHorizontalPaddingScale)
            }
            .layoutPriority(100)
            .padding(extraPadding)
        }
    }
    
    @ViewBuilder private func cardContent() -> some View {
        VStack {
            let symbolCount = card.number
            ForEach((0..<symbolCount), id: \.self) { index in
                #warning("??? Is ZStack necessary?")
                ZStack {
                    symbolWithProperShading()
                        .foregroundColor(card.color)
                        .aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    @ViewBuilder private func filledSymbol() -> some View {
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
    
    @ViewBuilder private func strokedSymbol() -> some View {
        switch card.shape {
            case .diamond:
                Diamond().stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
            case .rectangle:
                Rectangle().stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
            case .oval:
                Oval().stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
            case .circle:
                Circle().stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
        }
    }
    
    @ViewBuilder private func shadedSymbol() -> some View {
        switch card.shape {
            case .diamond:
                let diamond = Diamond()
                diamond.stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
                diamond.fill().opacity(DrawingConstants.shadedSymbolOpacity)
            case .rectangle:
                let rectangle = Rectangle()
                rectangle.stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
                rectangle.fill().opacity(DrawingConstants.shadedSymbolOpacity)
            case .oval:
                let oval = Oval()
                oval.stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
                oval.fill().opacity(DrawingConstants.shadedSymbolOpacity)
            case .circle:
                let circle = Rectangle()
                circle.stroke(lineWidth: DrawingConstants.symbolStrokeLineWidth)
                circle.fill().opacity(DrawingConstants.shadedSymbolOpacity)}
    }
    
    @ViewBuilder func symbolWithProperShading() -> some View {
        switch card.shading {
        case .solid:
            filledSymbol()
        case .shaded:
            shadedSymbol()
        case .open:
            strokedSymbol()
        }
    }
}



//struct ShapeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShapeCardView()
//    }
//}
