//
//  CharacterCardView.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import SwiftUI

struct CharacterCardView: View {
    var body: some View {
        private struct DrawingConstants {
            static let cornerRadius: CGFloat = 10.0
            static let borderLineWidth: CGFloat = 3.0
            static let symbolAspectRatio: CGFloat = 2
            static let contentPaddingScale: CGFloat = 0.05
        }
        var card: ClassicSetGameViewModel.Card
        
        init(for card: ClassicSetGameViewModel.Card) {
            self.card = card
        }
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.borderLineWidth).foregroundColor(.gray)
                    
                    VStack {
                        Spacer()
                        ForEach(0..<card.number) { index in
                            Rectangle().fill().foregroundColor(.pink).aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
                        }
                        Spacer()
                    }
                    .foregroundColor(.yellow)
                }.layoutPriority(100).padding(geometry.size.width * DrawingConstants.contentPaddingScale)

            }
        }    }
}

//struct CharacterSetCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCardView()
//    }
//}
