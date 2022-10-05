//
//  CardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 25..
//

import Foundation

protocol CardViewModel: Identifiable {
    associatedtype CardType
    init(with card: ShapeCardFeatures.CardType)
    
    
}
