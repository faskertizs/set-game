//
//  CardViewModel.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 25..
//

import Foundation

protocol CardViewModel: Identifiable where ID == UUID {
    associatedtype CardType where CardType: Card
    var card: CardType { get }

    init(with card: CardType)
}

extension CardViewModel {
    #warning("??? How can init with a common behavior be provided by the protocol itself?")
//    init(with card: CardType) {
//        self.card = card
//    }
    
    var isSelected: Bool { card.isSelected }
    var isInSet: Bool { card.isInSet }
    var isInMismatch: Bool { card.isInMismatch }
}
