//
//  SetGamePlay.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 17..
//

import Foundation

struct SetGamePlay<CardContents> where CardContents: CardFeatures {
    private var cards: [CardContents.CardType]
    
    private var setChecker: SetGameChecker<CardContents>

    init(with cardFeatures: CardContents) {
        setChecker = SetGameChecker<CardContents>(with: cardFeatures)
        
        cards = [CardContents.CardType]()

        for number in cardFeatures.numbers {
            for color in cardFeatures.colors {
                for figure in cardFeatures.figures {
                    for variation in cardFeatures.variations {
                        let card = CardContents.CardType(number: number, color: color, figure: figure, variation: variation)
                        cards.append(card)
                    }
                }
            }
        }
        cards.shuffle()
        
        for index in (0..<deckFirstIndex) {
            cards[index].isOnTable = true
        }
        
//        setGameNearFinish()
    }
    
    func cardsOnTable() -> [CardContents.CardType] {
        return cards.filter { $0.isOnTable == true }
    }
    
    private var deckFirstIndex = 12
    
    private func selectedCardIndices() -> [Int] {
        return cards.indices.filter({ cards[$0].isSelected })
    }
    
    private func inSetCardIndices() -> [Int] {
        return cards.indices.filter({ cards[$0].isInSet })
    }
    
    private func firstInSetCardIndex() -> Int? {
        return cards.indices.filter({ cards[$0].isInSet }).first
    }
    
    private mutating func deselectSelectedCards() {
        cards.indices.forEach { cards[$0].isSelected = false }
    }
    
    mutating func chooseCard(id: UUID) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        let chosenCard = cards[chosenIndex]
        
        if selectedCardIndices().count == 3 {
            // Set
            if inSetCardIndices().count == 3 {
                if !chosenCard.isInSet {
                    cards[chosenIndex].isSelected = true
                }
                replaceInSetCards()
            } else { // Mismatch: inSetCardIndices().count == 0
                deselectSelectedCards()
                dismismatchCards()
                cards[chosenIndex].isSelected = true
            }
        } else {
            cards[chosenIndex].isSelected.toggle()
            checkSet()

        }
        
//        if chosenCard.isInSet {
//            replaceInSetCards()
//        } else if chosenCard.isInMismatch {
//            deselectSelectedCards()
//            dismismatchCards()
//            cards[chosenIndex].isSelected.toggle()
//        } else if chosenCard.isSelected {
//            cards[chosenIndex].isSelected.toggle()
//        } else {
//            if selectedCardIndices().count == 3 {
//                deselectSelectedCards()
//                dismismatchCards()
//                emptyFoundSet()
//                cards[chosenIndex].isSelected.toggle()
//            } else {
//                cards[chosenIndex].isSelected.toggle()
//                checkSet()
//            }
//        }
    }
    
    private mutating func dismismatchCards() {
        cards.indices.forEach { cards[$0].isInMismatch = false }
    }
    
    private mutating func emptyFoundSet() {
        cards.indices.forEach { cards[$0].isInSet = false }
    }
    
    func isDeckEmpty() -> Bool {
        return deckFirstIndex >= cards.count
    }
    
    private mutating func checkSet() {
        if selectedCardIndices().count == 3 {
            
            let setWasFound = setChecker.areCardsASet(cards[selectedCardIndices()[0]],
                                    cards[selectedCardIndices()[1]],
                                    cards[selectedCardIndices()[2]])
            
            if setWasFound {
                cards.indices.forEach { cards[$0].isInSet = cards[$0].isSelected }
            } else {
                cards.indices.forEach { cards[$0].isInMismatch = cards[$0].isSelected }
            }
        }
    }
    
    #warning("!!! Need some animation on UI.")
    private mutating func replaceInSetCards() {
        while firstInSetCardIndex() != nil {
            let index = firstInSetCardIndex()!
            cards[index].isOnTable = false
            cards[index].isSelected = false
            cards[index].isInSet = false
            if !isDeckEmpty() {
                cards[deckFirstIndex].isOnTable = true
                cards.insert(cards.remove(at: deckFirstIndex), at: index)
                deckFirstIndex += 1
            }
        }
    }
    
    mutating func startNewGame() {
        deckFirstIndex = 12
        cards.indices.forEach { cards[$0].isOnTable =  $0 < deckFirstIndex}
        emptyFoundSet()
        dismismatchCards()
        deselectSelectedCards()
        cards.shuffle()
    }
    
    mutating func addCards() {
        if firstInSetCardIndex() != nil {
            replaceInSetCards()
        } else {
            for _ in (0..<3) {
                if !isDeckEmpty() {
                    cards[deckFirstIndex].isOnTable = true
                    deckFirstIndex += 1
                }
            }
        }
    }
    
// MARK: - Functions only for test
    
    private mutating func setGameNearFinish() {
        for index in cards.indices {
            cards[index].isOnTable = (index >= 75)
        }
        deckFirstIndex = 81
    }
    
    private func printMismatchedCardsForTest() {
        let array = cards.indices.filter({ cards[$0].isInMismatch })
        print("Mismatched cards: \(array)")
    }
    
    private func printInSetCardsForTest() {
        let array = cards.indices.filter({ cards[$0].isInSet })
        print("In set cards: \(array)")
    }
    
    private func beforeForTest() {
        print("Before")
        print("Selected cards: \(selectedCardIndices())")
        printMismatchedCardsForTest()
        printInSetCardsForTest()
        print("\n\n")
    }
    
    private func afterForTest() {
        print("After")
        print("Selected cards: \(selectedCardIndices())")
        printMismatchedCardsForTest()
        printInSetCardsForTest()
        print("\n\n")
    }
}
