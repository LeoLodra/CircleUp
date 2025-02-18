//
//  WouldYouRatherInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class WouldYouRatherInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .wouldYouRather: [
                Question(
                    title: "Would you rather always be 10 minutes late or 20 minutes early?",
                    options: ["10 minutes late", "20 minutes early"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "10 minutes late": [.glitchRebel: 2, .hyperNova: 1],
                        "20 minutes early": [.neonVisionary: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "Would you rather have unlimited wealth but no close friends, or an average income with deep friendships?",
                    options: ["Unlimited Wealth", "Deep Friendships"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Unlimited Wealth": [.neonVisionary: 2, .cyberPhantom: 1],
                        "Deep Friendships": [.hyperNova: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "Would you rather have the ability to fly or to teleport anywhere instantly?",
                    options: ["Fly", "Teleport"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Fly": [.electricMaverick: 2, .hyperNova: 1],
                        "Teleport": [.pulseShifter: 2, .glitchRebel: 1]
                    ]
                ),
                Question(
                    title: "Would you rather never need sleep or never need food?",
                    options: ["Never Sleep", "Never Eat"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Never Sleep": [.neonVisionary: 2, .luminousOracle: 1],
                        "Never Eat": [.hyperNova: 2, .electricMaverick: 1]
                    ]
                ),
                Question(
                    title: "Would you rather be world-famous but always misunderstood, or live in peace and anonymity?",
                    options: ["Famous & Misunderstood", "Peace & Anonymity"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Famous & Misunderstood": [.hyperNova: 2, .glitchRebel: 1],
                        "Peace & Anonymity": [.midnightMirage: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "Would you rather have the strength of 100 people or the speed of light?",
                    options: ["Super Strength", "Super Speed"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Super Strength": [.cyberPhantom: 2, .glitchRebel: 1],
                        "Super Speed": [.electricMaverick: 2, .pulseShifter: 1]
                    ]
                ),
                Question(
                    title: "Would you rather have to sing everything you say or dance everywhere you go?",
                    options: ["Sing Everything", "Dance Everywhere"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Sing Everything": [.hyperNova: 2, .luminousOracle: 1],
                        "Dance Everywhere": [.electricMaverick: 2, .pulseShifter: 1]
                    ]
                ),
                Question(
                    title: "Would you rather live 100 years in the past or 100 years in the future?",
                    options: ["Past", "Future"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Past": [.midnightMirage: 2, .luminousOracle: 1],
                        "Future": [.neonVisionary: 2, .pulseShifter: 1]
                    ]
                ),
                Question(
                    title: "Would you rather only be able to whisper or only be able to shout?",
                    options: ["Whisper", "Shout"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Whisper": [.midnightMirage: 2, .luminousOracle: 1],
                        "Shout": [.hyperNova: 2, .electricMaverick: 1]
                    ]
                ),
                Question(
                    title: "Would you rather explore the vastness of space or the mysteries of the deep ocean?",
                    options: ["Space", "Deep Ocean"],
                    type: .wouldYouRather,
                    personalityScores: [
                        "Space": [.neonVisionary: 2, .luminousOracle: 1],
                        "Deep Ocean": [.cyberPhantom: 2, .midnightMirage: 1]
                    ]
                )
            ]
        ])
    }
}
