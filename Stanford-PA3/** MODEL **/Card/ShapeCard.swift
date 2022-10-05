//
//  ShapeCard.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 21..
//

import Foundation

struct ShapeCard: Card {
    let id: UUID
    let number: Int
    let color: ColorFeature
    let figure: ShapeFeature
    let variation: ShadingFeature
    
    init(number: Int, color: ColorFeature, figure: ShapeFeature, variation: ShadingFeature) {
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
