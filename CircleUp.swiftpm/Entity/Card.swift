//
//  Card.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var effect: CardEffect
}

enum CardEffect {
    case skipTurn
    case reverseOrder
    case teamUp // NOT DONE: What to do with the name (UI Problem)
    case stealWild
    case swapActivity
    case majorityRules // NOT DONE: The most common answer wins; those who answer differently get a challenge.
}
