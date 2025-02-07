//
//  Player.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

enum PersonalityTrait: String, CaseIterable {
    case bold = "Bold"
    case thoughtful = "Thoughtful"
    case funny = "Funny"
    case competitive = "Competitive"
    case empathetic = "Empathetic"
}

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var traits: [PersonalityTrait: Int] = [:]
    var hand: [Card] = []
}
