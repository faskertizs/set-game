//
//  CardContentProvider.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 16..
//

import Foundation

protocol CardContentProvider {
    associatedtype CardContents where CardContents: CardFeatures
    
    var cardFeatures: CardContents { get }
}
