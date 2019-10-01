//
//  Main.swift
//  
//
//  Created by Mykola ZHURBA on 10/1/19.
//
//

let deck = Deck(sorted: false)
var x: Card?
print("Full deck mixed")
print(deck.description)
print()
print("Drawing 10 cards")
for _ in 0...10 {
    x = deck.draw()
    if x != nil {
        print(x!)
    }
}
print()
print("Checking out Deck.outs")
print(deck.outs)

deck.fold(c: deck.outs[1])
deck.fold(c: deck.outs[1])
deck.fold(c: deck.cards[0])
print()
print("Folding some random cards and tesing result")
print(deck.disards)
