//
//  Card.swift
//  
//
//  Created by Mykola ZHURBA on 10/1/19.
//

import Foundation

class Card: NSObject {
    var color: Color
    var value: Value
    
    init(color: Color, value: Value) {
        self.color = color
        self.value = value
        super.init()
    }
    
    override var description: String {
        return "\(color.rawValue)\(value)"
    }
    
    override func isEqual(_ to: Any?) -> Bool {
        if let card = to as? Card {
            return self.color == card.color && self.value == card.value
        }
        return false
    }
}

func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.isEqual(rhs)
}
