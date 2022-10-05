//
//  ShapeSetGameView.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

struct ShapeSetGameView: View {
    private struct DrawingConstants {
        static let aspectRatio: CGFloat = 2/3
        static let cardPaddingScale: CGFloat = 0.05
        static let cardSpaceMinimumWidth: CGFloat = 80
    }
    
    @ObservedObject private var viewModel: ShapeSetGameViewModel
    
    init(viewModel: ShapeSetGameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        let cardViewModels = viewModel.cardViewModels()

        VStack {
            AspectVGrid(items: cardViewModels, aspectRatio: DrawingConstants.aspectRatio, minimumWidth: DrawingConstants.cardSpaceMinimumWidth) { card in
                GeometryReader { geometry in
                    ShapeCardView(for: card).padding(geometry.size.width * DrawingConstants.cardPaddingScale)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
            }
            Spacer()
            HStack {
                newGame()
                Spacer()
                hint
                Spacer()
                addCards
            }
            .padding(.horizontal, 15)
        }
        .alert("No more hint", isPresented: $viewModel.noMoreHint) {
            Button("Ok", action: {} )
        }
    }
    
    func newGame() -> some View {
        Button {
            viewModel.newGame()
        } label: {
            Text("New Game")
        }
    }
    
    var hint: some View {
        Button {
            viewModel.showHint()
        } label: {
            Text("Hint")
        }
    }
    
    var addCards: some View {
        Button {
            viewModel.addCards()
        } label: {
            Text("+3")
        }
        .disabled(viewModel.isAddCardsButtonDisabled())
    }
}





























struct ShapeSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeSetGameView(viewModel: GameSetupCoordinator().viewModel)
            .preferredColorScheme(.dark)
        ShapeSetGameView(viewModel: GameSetupCoordinator().viewModel)
            .preferredColorScheme(.light)
    }
}
