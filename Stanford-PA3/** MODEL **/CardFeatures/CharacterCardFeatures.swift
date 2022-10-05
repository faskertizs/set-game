//
//  CharacterCardFeatures.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

struct CharacterCardFeatures: CardFeatures {
    typealias CardType = CharacterCard

    var numbers: [Int]
    var colors: [ColorFeature]
    var figures: [String]
    var variations: [CharacterEmphasis]
}
