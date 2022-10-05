//
//  Card.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 21..
//

import Foundation

protocol Card: Identifiable {
    associatedtype Color where Color: Equatable
    associatedtype Figure where Figure: Equatable
    associatedtype Variation where Variation: Equatable
    
    var id: UUID { get }
    var number: Int { get }
    var color: Color { get }
    var figure: Figure { get }
    var variation: Variation { get }
    
    init(number: Int, color: Color, figure: Figure, variation: Variation)
    
    var isOnTable: Bool { get set }
    var isSelected: Bool { get set }
    var isInSet: Bool { get set }
    var isInMismatch: Bool { get set }

}
