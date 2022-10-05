//
//  CardFeatures.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 18..
//

import Foundation

protocol CardFeatures {
    associatedtype Color
    associatedtype Figure
    associatedtype Variation
    associatedtype CardType: Card where CardType.Color == Color, CardType.Figure == Figure, CardType.Variation == Variation
    
    var numbers: [Int] { get }
    var colors: [Color] { get }
    var figures: [Figure]  { get }
    var variations: [Variation] { get }
    
    
}
