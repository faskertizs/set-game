//
//  SetGameViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

protocol SetGameViewModel: ObservableObject {
    associatedtype CardContents where CardContents: CardFeatures
    associatedtype CardType where CardContents.CardType == CardType
    associatedtype CardViewModel

    var gamePlay: SetGamePlay<CardContents> { get }
    var cards: [CardType] { get }
    
    func cardViewModels() -> [CardViewModel]
    
    func choose(card: CardViewModel)
}
