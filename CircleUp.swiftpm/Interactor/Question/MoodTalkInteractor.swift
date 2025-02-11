//
//  MoodTalkInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 11/02/25.
//


final class MoodTalkInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .moodTalk: [
                Question(title: "What made you smile today?", options: nil, type: .moodTalk),
                Question(title: "Describe your mood in one word.", options: nil, type: .moodTalk),
                Question(title: "What’s one thing you’re grateful for today?", options: nil, type: .moodTalk),
                Question(title: "If you could relive one moment today, what would it be?", options: nil, type: .moodTalk),
                Question(title: "What’s something that made you feel proud recently?", options: nil, type: .moodTalk),
                Question(title: "What’s your biggest stressor right now?", options: nil, type: .moodTalk),
                Question(title: "What’s one goal you have for the next week?", options: nil, type: .moodTalk),
                Question(title: "How do you usually deal with stress?", options: nil, type: .moodTalk),
                Question(title: "What’s one thing you love about yourself?", options: nil, type: .moodTalk),
                Question(title: "What’s one thing you’re looking forward to?", options: nil, type: .moodTalk)
            ]
        ])
    }
}
