//
//  SetGameChecker.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 24..
//

import Foundation

struct SetGameChecker<CardContents> where CardContents: CardFeatures {
    typealias Card = CardContents.CardType
    
    var cardFeatures: CardContents
    
    init(with cardFeatures: CardContents) {
        self.cardFeatures = cardFeatures
    }
    
    func areCardsASet(_ c1: Card, _ c2: Card, _ c3: Card) -> Bool {
        if c3.number == cardFeatures.numbers.requiredValue(to: c1.number, and: c2.number) {
            if c3.color == cardFeatures.colors.requiredValue(to: c1.color, and: c2.color) {
                if c3.figure == cardFeatures.figures.requiredValue(to: c1.figure, and: c2.figure) {
                    if c3.variation == cardFeatures.variations.requiredValue(to: c1.variation, and: c2.variation) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func thirdCardToHaveASet(for first: Card, and second: Card) -> Card {
        #warning("!!! Handle fatalError case")
        guard let number = cardFeatures.numbers.requiredValue(to: first.number, and: second.number) else { fatalError() }
        guard let  color = cardFeatures.colors.requiredValue(to: first.color, and: second.color)  else { fatalError() }
        guard let  figure = cardFeatures.figures.requiredValue(to: first.figure, and: second.figure)  else { fatalError() }
        guard let  variation = cardFeatures.variations.requiredValue(to: first.variation, and: second.variation)  else { fatalError() }
                                                        
        return Card(number: number, color: color, figure: figure, variation: variation)
    }
}


