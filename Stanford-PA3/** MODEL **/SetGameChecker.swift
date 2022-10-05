//
//  SetGameChecker.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 24..
//

import Foundation

struct SetGameChecker<CardContents> where CardContents: CardFeatures {
    var cardFeatures: CardContents
    
    init(with cardFeatures: CardContents) {
        self.cardFeatures = cardFeatures
    }
    
    func areCardsASet(_ c1: CardContents.CardType, _ c2: CardContents.CardType, _ c3: CardContents.CardType) -> Bool {
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
}


