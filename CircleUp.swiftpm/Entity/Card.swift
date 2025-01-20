//
//  Card.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

enum CardType {
    case strategy, personal, wildcard
}

struct Card: Identifiable {
    let id = UUID()
    let type: CardType
    let title: String
    let description: String
    let points: Int
    let skillEffect: SkillEffect?
}

struct SkillEffect {
    let skillType: SkillType
    let value: Int
}
