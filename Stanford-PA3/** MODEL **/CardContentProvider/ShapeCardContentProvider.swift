//
//  ShapeCardContentProvider.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 16..
//

import Foundation

struct ShapeCardContentProvider: CardContentProvider {
    enum CardContentType {
        case classic
        case random
    }
    
    var cardFeatures: ShapeCardFeatures
    
    init(cardContentType: CardContentType) {
        switch cardContentType {
            case .classic:
                cardFeatures = ShapeCardFeatures(
                    numbers: [1, 2, 3],
                    colors: [.green, .purple, .red],
                    figures: [.diamond, .rectangle, .oval],
                    variations: [.solid, .shaded, .open]
                )
            case .random:
                cardFeatures = ShapeCardFeatures(
                    numbers: [1, 2, 3],
                    colors: ColorFeature.generateValueArray().randomElements(count: 3),
                    figures: ShapeFeature.generateValueArray().randomElements(count: 3),
                    variations: ShadingFeature.generateValueArray().randomElements(count: 3)
                )
            
//            do {
//                guard let someColors = try Self.colors.randomElements(count: 3) else {return nil}
//                guard let someShapes = try Self.shapes.randomElements(count: 3) else {return nil}
//                guard let someShadings = try Self.shadings.randomElements(count: 3) else {return nil}
//
//                cardBuildingFeatures = CardFeatures(
//                    numbers: Self.numbers,
//                    colors: someColors,
//                    shapes: someShapes,
//                    shadings: someShadings
//                )
//            }
//            catch
//            {
//                print("ERROR")
//            }
        }
    }
}
