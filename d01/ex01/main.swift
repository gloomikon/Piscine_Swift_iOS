//
//  Main.swift
//  
//
//  Created by Mykola ZHURBA on 10/1/19.
//
//

let cards: [Card] = [
    Card(color: Color.clubs, value: Value.three),
    Card(color: Color.diamonds, value: Value.king),
    Card(color: Color.hearts, value: Value.three),
    Card(color: Color.spades, value: Value.ace),
    Card(color: Color.spades, value: Value.ace),
    Card(color: Color.hearts, value: Value.two),
    Card(color: Color.clubs, value: Value.two),
    Card(color: Color.hearts, value: Value.two),
    Card(color: Color.diamonds, value: Value.king)
]

print("Cards:")
for card in cards {
    print("\(card)")
}

print("\nTesting .isEqual()")
for card1 in cards {
    for card2 in cards {
        print("\(card1)\t" + (card1.isEqual(card2) ? "is equal\t" : "is not equal\t") + "\(card2)")
    }
}

print("\nTesting ==")
for card1 in cards {
    for card2 in cards {
        print("\(card1)\t" + (card1 == card2 ? "==\t" : "!=\t") + "\(card2)")
    }
}
