//
//  ShapeCardFeatures.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 18..
//

import Foundation

struct ShapeCardFeatures: CardFeatures {
    typealias CardType = ShapeCard
    
    var numbers: [Int]
    var colors: [ColorFeature]
    var figures: [ShapeFeature]
    var variations: [ShadingFeature]
}
