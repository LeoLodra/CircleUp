//
//  Card.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

struct Card: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var effect: CardEffect
}

enum CardEffect {
    case skipTurn
    case reverseOrder
    case teamUp
    case stealWild
    case swapActivity
}
