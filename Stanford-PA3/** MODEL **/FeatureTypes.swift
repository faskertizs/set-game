//
//  FeatureTypes.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 18..
//

import Foundation

enum ColorFeature: CaseIterable {
    case blue
    case green
    case orange
    case purple
    case red
}

enum ShapeFeature: CaseIterable {
    case diamond
    case rectangle
    case oval
    case circle
}

enum ShadingFeature: CaseIterable {
    case solid
    case shaded
    case open
}

struct CharacterFigures {
    static var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z"]
    static var digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    static var japanese = ["日", "月", "火", "水", "木", "金", "土"]
}

enum CharacterEmphasis: CaseIterable {
    case none
    case bold
    case underlined
    case italic
    case strikethrough
}

