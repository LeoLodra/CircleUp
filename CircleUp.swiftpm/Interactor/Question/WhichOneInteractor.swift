//
//  WhichOneInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 11/02/25.
//


import Foundation

final class WhichOneInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .whichOne: [
                Question(
                    title: "Which one describes you best?",
                    options: ["Logical Thinker", "Creative Dreamer"],
                    type: .whichOne,
                    personalityScores: [
                        "Logical Thinker": [.neonVisionary: 2, .luminousOracle: 1],
                        "Creative Dreamer": [.hyperNova: 2, .glitchRebel: 1]
                    ]
                ),
                Question(
                    title: "Which one feels more like home?",
                    options: ["Bustling City", "Quiet Countryside"],
                    type: .whichOne,
                    personalityScores: [
                        "Bustling City": [.hyperNova: 2, .electricMaverick: 1],
                        "Quiet Countryside": [.luminousOracle: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "Which one is your vibe?",
                    options: ["Carefree Adventurer", "Meticulous Planner"],
                    type: .whichOne,
                    personalityScores: [
                        "Carefree Adventurer": [.electricMaverick: 2, .glitchRebel: 1],
                        "Meticulous Planner": [.neonVisionary: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "Which one would people say about you?",
                    options: ["Always Early", "Always Late"],
                    type: .whichOne,
                    personalityScores: [
                        "Always Early": [.neonVisionary: 2, .midnightMirage: 1],
                        "Always Late": [.glitchRebel: 2, .hyperNova: 1]
                    ]
                ),
                Question(
                    title: "Which one matches your social style?",
                    options: ["Life of the Party", "Deep Conversations Only"],
                    type: .whichOne,
                    personalityScores: [
                        "Life of the Party": [.hyperNova: 2, .electricMaverick: 1],
                        "Deep Conversations Only": [.luminousOracle: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "Which one is more appealing?",
                    options: ["Endless Knowledge", "Endless Creativity"],
                    type: .whichOne,
                    personalityScores: [
                        "Endless Knowledge": [.luminousOracle: 2, .neonVisionary: 1],
                        "Endless Creativity": [.hyperNova: 2, .glitchRebel: 1]
                    ]
                ),
                Question(
                    title: "Which one do you rely on more?",
                    options: ["Intuition", "Logic"],
                    type: .whichOne,
                    personalityScores: [
                        "Intuition": [.pulseShifter: 2, .hyperNova: 1],
                        "Logic": [.neonVisionary: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "Which one is your ideal way to relax?",
                    options: ["Binge-Watching Shows", "Reading a Book"],
                    type: .whichOne,
                    personalityScores: [
                        "Binge-Watching Shows": [.hyperNova: 2, .pulseShifter: 1],
                        "Reading a Book": [.luminousOracle: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "Which one fits your decision-making style?",
                    options: ["Go With the Flow", "Plan Everything"],
                    type: .whichOne,
                    personalityScores: [
                        "Go With the Flow": [.glitchRebel: 2, .electricMaverick: 1],
                        "Plan Everything": [.neonVisionary: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "Which one do you secretly wish for?",
                    options: ["More Time", "More Money"],
                    type: .whichOne,
                    personalityScores: [
                        "More Time": [.midnightMirage: 2, .luminousOracle: 1],
                        "More Money": [.glitchRebel: 2, .hyperNova: 1]
                    ]
                )
            ]
        ])
    }
}
