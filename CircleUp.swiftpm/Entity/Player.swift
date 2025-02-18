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
        print(personalityScores)
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
            return .pulseShifter // Default fallback if no data
        }
        
        // Compute total points across all personality traits
        let totalPoints = personalityScores.values.reduce(0, +)
        
        // Normalize scores as percentages
        let normalizedScores = personalityScores.mapValues { score in
            (Double(score) / Double(totalPoints)) * 100
        }
        
        // Find the trait with the highest normalized percentage
        let dominantTrait = normalizedScores.max { $0.value < $1.value }?.key ?? .pulseShifter
        
        print("\(personalityScores)")
        print("Normalized Scores: \(normalizedScores)")
        print("Dominant Trait: \(dominantTrait.rawValue)")
        
        return dominantTrait
    }
}

//Cyber Phantom – Mysterious and unpredictable, always making bold moves.
//Electric Maverick – A risk-taker who thrives on excitement and challenges.
//Luminous Oracle – Thoughtful and insightful, always seeing deeper meanings.
//Glitch Rebel – Defies expectations, always twisting the game’s mechanics.
//Neon Visionary – A strategist who carefully plans every move.
//Hyper Nova – Energetic and loud, always bringing the party to life.
//Midnight Mirage – Cool and composed, observing before striking.
//Pulse Shifter – Adapts to any situation, always staying one step ahead.
