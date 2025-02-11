//
//  QuickChallengeInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class QuickChallengeInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .quickChallenge: [
                Question(title: "Do 10 jumping jacks in 10 seconds!", options: nil, type: .quickChallenge),
                Question(title: "Hold your breath for 30 seconds.", options: nil, type: .quickChallenge),
                Question(title: "Spin around 5 times and try to walk in a straight line.", options: nil, type: .quickChallenge),
                Question(title: "Balance a spoon on your nose for 10 seconds.", options: nil, type: .quickChallenge),
                Question(title: "Recite the alphabet backwards as fast as you can.", options: nil, type: .quickChallenge),
                Question(title: "Do your best animal impression for 10 seconds.", options: nil, type: .quickChallenge),
                Question(title: "Make up a short song about something in the room.", options: nil, type: .quickChallenge),
                Question(title: "Act like a robot until your next turn.", options: nil, type: .quickChallenge),
                Question(title: "Try to lick your elbow.", options: nil, type: .quickChallenge),
                Question(title: "Do your best superhero pose and hold it for 5 seconds.", options: nil, type: .quickChallenge)
            ]
        ])
    }
}
