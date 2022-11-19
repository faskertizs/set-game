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
    
    private var shownHints: Array<(Set<Int>)> = Array()

    private let startingCardsCount = 12

    private var deckFirstIndex: Int
    
    var noMoreHint = false

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
        
        deckFirstIndex = startingCardsCount
        
        for index in (0..<deckFirstIndex) {
            cards[index].isOnTable = true
        }
        
//        setGameNearFinishForTest()
    }
    
    
// MARK: - Data Providers
    
    func cardsOnTable() -> [CardContents.CardType] {
        return cards.filter { $0.isOnTable == true }
    }
    
    func isDeckEmpty() -> Bool {
        return deckFirstIndex >= cards.count
    }
    
// MARK: - Intents
    
    mutating func selectCard(id: UUID) {
        guard let selectedIndex = cards.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        let selectedICard = cards[selectedIndex]
        
        if selectedCardIndices().count == 3 || !shownHints.isEmpty {
            if inSetCardIndices().count == 3 {            // Set
                if !selectedICard.isInSet {
                    cards[selectedIndex].isSelected = true
                }
                replaceCardsInSet()
            } else {                            // Mismatch: inSetCardIndices().count == 0
                unmarkAllCards()
                shownHints = Array()
                cards[selectedIndex].isSelected = true
            }
        } else {
            cards[selectedIndex].isSelected.toggle()
            checkSet()
        }
    }
    
    mutating func startNewGame() {
        emptyFoundSet()
        unmarkAllCards()
        cards.shuffle()
        deckFirstIndex = startingCardsCount
        cards.indices.forEach { cards[$0].isOnTable =  $0 < deckFirstIndex}
    }
    
    mutating func indicateHint() {
        unmarkAllCards()
        if inSetCardIndices().count == 3 {
            replaceCardsInSet()
        }
        
        let newHintFound = checkForNextHint()
        
        if newHintFound.found {
            #warning("!!! Handle fatalError case")
            guard let hint = newHintFound.hint else { fatalError() }
            let first = hint.sorted()[0]
            let second = hint.sorted()[1]
            let third = hint.sorted()[2]

            cards[first].isHinted = true
            cards[second].isHinted = true
            cards[third].isHinted = true
            
            shownHints.append(hint)
        } else {
            noMoreHint = true
            
            unmarkAllCards()
            shownHints = Array()
        }
    }
    
    mutating func hideHintIndication() {
        shownHints = []
        cards.indices.forEach { cards[$0].isHinted = false }
    }
    
    mutating func addCards() {
        if firstInSetCardIndex() != nil {
            replaceCardsInSet()
        } else {
            for _ in (0..<3) {
                if !isDeckEmpty() {
                    cards[deckFirstIndex].isOnTable = true
                    deckFirstIndex += 1
                }
            }
        }
    }
    
// MARK: - Helper Methods
    
    private func selectedCardIndices() -> [Int] {
        return cards.indices.filter({ cards[$0].isSelected })
    }
    
    private func inSetCardIndices() -> [Int] {
        return cards.indices.filter({ cards[$0].isInSet })
    }
    
    private func firstInSetCardIndex() -> Int? {
        return cards.indices.filter({ cards[$0].isInSet }).first
    }
    
    private mutating func unmarkAllCards() {
        cards.indices.forEach {
            cards[$0].isSelected = false
            cards[$0].isInMismatch = false
            cards[$0].isHinted = false
        }
    }
    
    private mutating func emptyFoundSet() {
        cards.indices.forEach { cards[$0].isInSet = false }
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
    private mutating func replaceCardsInSet() {
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
    
    private func checkForNextHint() -> (found: Bool, hint: Set<Int>?) {

        func checkHint(with first: Int, and second: Int) ->  (found: Bool, hint: Set<Int>?) {
            let matchingCard = setChecker.thirdCardToHaveASet(for: cards[first], and: cards[second])
            guard let thirdCard = cards.first(where: {
                return $0.number == matchingCard.number &&
                $0.color == matchingCard.color &&
                $0.figure == matchingCard.figure &&
                $0.variation == matchingCard.variation
            #warning("!!! Handle fatalError case")
            } ) else { fatalError() }
            
            if thirdCard.isOnTable {
                #warning("!!! Handle fatalError case")
                guard let third = cards.firstIndex(where: { $0.id == thirdCard.id } ) else { fatalError() }
                let hint: Set<Int> = [first, second, third]
                if !shownHints.contains(hint) {
                    return (found: true, hint: hint)
                }
            }

            return (found: false, hint: nil)
        }

        var firstToCheck: Int
        var secondToCheck: Int

        if let lastHint = shownHints.last {
            let lastHintArray: Array<Int> = lastHint.sorted()
            firstToCheck = lastHintArray[0]
            secondToCheck = lastHintArray[1]
        } else {
            firstToCheck = 0
            secondToCheck = 1
        }
        
        var newHintFound: (found: Bool, hint: Set<Int>?) = (found: false, hint: nil)
        
        if cards[firstToCheck].isOnTable {
            for second in (secondToCheck..<cards.count) {
                if cards[second].isOnTable  {
                    newHintFound = checkHint(with: firstToCheck, and: second)
                    if newHintFound.found == true {
                        return newHintFound
                    }
                }
            }
        }
        
        for first in (firstToCheck + 1..<cards.count) {
            if cards[first].isOnTable {
                for second in ((first + 1)..<cards.count) {
                    if cards[second].isOnTable {
                        newHintFound = checkHint(with: first, and: second)
                        if newHintFound.found == true {
                            return newHintFound
                        }
                    }
                }
            }
        }

        return newHintFound
    }
    
// MARK: - Functions only for test
    
    private mutating func setGameNearFinishForTest() {
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
