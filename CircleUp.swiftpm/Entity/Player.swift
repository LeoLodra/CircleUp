//
//  Player.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation
import SwiftUICore

struct Player: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var hand: [Card] = []
    var color: Color
    var personalityScores: [PersonalityType: Int] = [:]
    
    mutating func addPersonalityPoints(for choice: String, from question: Question) {
        guard let scores = question.personalityScores![choice] else { return }
        for (trait, points) in scores {
            personalityScores[trait, default: 0] += points
        }
    }
}

enum PersonalityType: String {
    case cyberPhantom = "Cyber Phantom"
    case electricMaverick = "Electric Maverick"
    case luminousOracle = "Luminous Oracle"
    case glitchRebel = "Glitch Rebel"
    case neonVisionary = "Neon Visionary"
    case hyperNova = "Hyper Nova"
    case midnightMirage = "Midnight Mirage"
    case pulseShifter = "Pulse Shifter"
}

extension Player {
    func calculatePersonalityType() -> PersonalityType {
        guard !personalityScores.isEmpty else {
            return .midnightMirage
        }
        
        let totalPoints = personalityScores.values.reduce(0, +)
        
        let normalizedScores = personalityScores.mapValues { score in
            (Double(score) / Double(totalPoints)) * 100
        }
        
        let dominantTrait = normalizedScores.max { $0.value < $1.value }?.key ?? .pulseShifter
        
        return dominantTrait
    }
}
