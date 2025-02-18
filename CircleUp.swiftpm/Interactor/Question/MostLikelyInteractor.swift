//
//  MostLikelyInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

final class MostLikelyInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .mostLikely: [
                Question(
                    title: "Who is most likely to survive alone in the wilderness?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.neonVisionary: 2, .electricMaverick: 1]]
                ),
                Question(
                    title: "Who is most likely to forget their own birthday?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.luminousOracle: 2, .pulseShifter: 1]]
                ),
                Question(
                    title: "Who is most likely to become famous?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.hyperNova: 2, .electricMaverick: 1]]
                ),
                Question(
                    title: "Who is most likely to spend all their money on impulse purchases?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.glitchRebel: 2, .pulseShifter: 1]]
                ),
                Question(
                    title: "Who is most likely to trip over their own feet?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.pulseShifter: 2, .hyperNova: 1]]
                ),
                Question(
                    title: "Who is most likely to win a competition they never trained for?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.electricMaverick: 2, .neonVisionary: 1]]
                ),
                Question(
                    title: "Who is most likely to get into trouble for breaking the rules?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.glitchRebel: 3]]
                ),
                Question(
                    title: "Who is most likely to cry during a movie?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.luminousOracle: 2, .midnightMirage: 1]]
                ),
                Question(
                    title: "Who is most likely to become a millionaire?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.neonVisionary: 2, .midnightMirage: 1]]
                ),
                Question(
                    title: "Who is most likely to forget an important event?",
                    options: nil,
                    type: .mostLikely,
                    personalityScores: ["default": [.luminousOracle: 2, .hyperNova: 1]]
                )
            ]
        ])
    }
}
