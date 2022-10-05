//
//  ShapeSetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 17..
//

import Foundation

class ShapeSetGameViewModel: SetGameViewModel {
    typealias CardContents = ShapeCardFeatures
    typealias CardType = ShapeCard
    typealias CardVM = ShapeCardViewModel
    
    #warning("??? gamePlay and cards cannot be private only internal. I do not understand this 'internal' access control.")
    @Published var gamePlay: SetGamePlay<ShapeCardFeatures>

    required init(with cardFeatures: ShapeCardFeatures) {
        gamePlay = SetGamePlay(with: cardFeatures)
    }
}
