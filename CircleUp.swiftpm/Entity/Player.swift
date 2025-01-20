//
//  Card.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

enum SkillType {
    case insight, charisma, strategy
}

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var points: Int
    var skills: [SkillType: Int]
}
