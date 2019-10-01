//
//  File.swift
//  
//
//  Created by Mykola ZHURBA on 10/1/19.
//

import Foundation

class Deck: NSObject {
    static let allSpades = Value.allValues.map({Card(color: Color.spades, value: $0)})
    static let allDiamonds = Value.allValues.map({Card(color: Color.diamonds, value: $0)})
    static let allHearts = Value.allValues.map({Card(color: Color.hearts, value: $0)})
    static let allClubs = Value.allValues.map({Card(color: Color.clubs, value: $0)})
    
    static let allCards = allSpades + allDiamonds + allHearts + allClubs
    
    var cards: [Card]
    var disards: [Card]
    var outs: [Card]
    
    init(sorted: Bool) {
        cards = Deck.allCards
        disards = []
        outs = []
        if (!sorted) {
            cards.shuffle()
        }
        super.init()
    }
    
    override public var description: String {
        return cards.description
    }
    
    func draw() -> Card? {
        var card: Card?
        card = cards.first
        if card != nil {
            outs.append(card!)
            cards.removeFirst()
        }
        return card
    }
    
    func fold(c: Card) {
        if let i = outs.firstIndex(of: c) {
            disards.append(c)
            outs.remove(at: i)
        }
    }
}

extension Array {
    mutating func shuffle() {
        if (count < 2) { return }
        for i in 0..<count {
            let j = Int(arc4random_uniform(UInt32(count)))
            if (i != j) {
                self.swapAt(i, j)
            }
        }
    }
}
