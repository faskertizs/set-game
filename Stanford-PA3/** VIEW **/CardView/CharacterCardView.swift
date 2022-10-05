//
//  CharacterCardView.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import SwiftUI

struct CharacterCardView: View {
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let borderLineWidth: CGFloat = 3.0
        static let symbolAspectRatio: CGFloat = 2
        static let contentPaddingScale: CGFloat = 0.05
        static let fontScale: CGFloat = 0.75
        static let contentHorizontalPaddingScale: CGFloat = 0.2
        static let symbolStrokeLineWidth: CGFloat = 3
        static let shadedSymbolOpacity: Double = 0.3
        static let extraPaddingScaleForCardsInSet: CGFloat = 0.2
    }
    
    var card: CharacterCardViewModel

    init(for card: CharacterCardViewModel) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            let extraPadding = card.isInSet ? geometry.size.width * DrawingConstants.extraPaddingScaleForCardsInSet : 0
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(card.isInMismatch ? .black : (card.isSelected ? .yellow : .white))
                shape.strokeBorder(lineWidth: DrawingConstants.borderLineWidth).foregroundColor(.gray)
                
                cardContent()
                    .padding(geometry.size.width * DrawingConstants.contentHorizontalPaddingScale)
            }.layoutPriority(100)
            .padding(extraPadding)
        }
    }
    
    @ViewBuilder private func cardContent() -> some View {
        VStack {
            let symbolCount = card.number
            ForEach((0..<symbolCount), id: \.self) { index in
                GeometryReader { geometry in
                    #warning("??? Is ZStack necessary?")
                    ZStack {
                        emphasizedText(string: card.character, emphasis: card.attribute)
                            .font(font(in: geometry.size))
                            .foregroundColor(card.color)
                            .aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
                    }
                }
            }
        }
    }
    
    #warning("??? Where should I put this helper function?")
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    #warning("??? Where should I put this helper function?")
    private func emphasizedText(string: String, emphasis:CharacterEmphasis) -> Text {
        switch emphasis {
            case .none:
                return Text(string)
            case .bold:
                return Text(string).bold()
            case .underlined:
                return Text(string).underline()
            case .italic:
                return Text(string).italic()
            case .strikethrough:
                return Text(string).strikethrough()
        }
        #warning("!!! Check underlined g or italic j. Something is wrong.")
//        return Text("g").underline()
//        return Text("").italic()
    }
}

//struct CharacterCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCardView()
//    }
//}
