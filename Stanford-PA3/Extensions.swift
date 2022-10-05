//
//  Extensions.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 17..
//

import SwiftUI

// MARK: - Array
extension Array {
    
    #warning ("!!! This will crash if count is out of range!")
    func randomElements(count: Int) -> [Element] {
        var randomElements = [Element]()
        let shuffledArray = self.shuffled()
        for index in 0..<count {
            randomElements.append(shuffledArray[index])
        }

        return randomElements
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}

#warning("??? Can I somehow specify a restriction to count of array?")
#warning("!!! Horrible naming!")
extension Array where Element: Equatable {
    func requiredValue(to value1: Element, and value2: Element) -> Element? {
        if self.count != 3 || !self.contains(value1) || !self.contains(value2) {
            #warning("??? Maybe fatalError?")
            return nil
        }
                
        if value1 == value2 {
            return value1
        } else {
            var values = self
            guard let indexOfValue1 = values.firstIndex(of: value1) else { return nil }
            values.remove(at: indexOfValue1)
            guard let indexOfValue2 = values.firstIndex(of: value2) else { return nil }
            values.remove(at: indexOfValue2)
            
            return values.oneAndOnly
        }
    }
}

// MARK: - CaseIterable

extension CaseIterable {
    static func generateValueArray() -> [Self] {
        var valueArray = [Self]()
        for value in Self.allCases {
            valueArray.append(value)
        }
        return valueArray
    }
}

// MARK: - Color

extension Color {
     static func convert(_ colorFeature: ColorFeature) -> Color {
        var color: Color
        switch colorFeature {
            case .blue:
                color = Color.blue
            case .green:
                color = Color.green
            case .orange:
                color = Color.orange
            case .purple:
                color = Color.purple
            case .red:
                color = Color.red
        }
        
        return color
    }
}
