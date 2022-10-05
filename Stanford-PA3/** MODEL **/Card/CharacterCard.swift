//
//  CharacterCard.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 21..
//

import Foundation

struct CharacterCard: Card {
    var id: UUID
    var number: Int
    var color: ColorFeature
    var figure: String
    var variation: CharacterEmphasis
    
    init(number: Int, color: ColorFeature, figure: String, variation: CharacterEmphasis) {
        self.id = UUID()
        self.number = number
        self.color = color
        self.figure = figure
        self.variation = variation
    }
    
    var isOnTable = false
    var isSelected = false
    var isInSet = false
    var isInMismatch = false
    var isHinted = false
}
