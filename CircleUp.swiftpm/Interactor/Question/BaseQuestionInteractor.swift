//
//  BaseQuestionInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


import Foundation

class BaseQuestionInteractor {
    private var questions: [ActivityType: [Question]] = [
        .mostLikely: [
            Question(title: "Who is most likely to survive a zombie apocalypse?", options: nil, type: .mostLikely),
            Question(title: "Who is most likely to forget their own birthday?", options: nil, type: .mostLikely)
        ],
        .wouldYouRather: [
            Question(title: "Would you rather always be 10 minutes late or 20 minutes early?", options: ["10 minutes late", "20 minutes early"], type: .wouldYouRather),
            Question(title: "Would you rather have unlimited money or unlimited time?", options: ["Unlimited Money", "Unlimited Time"], type: .wouldYouRather)
        ]
    ]
    
    func fetchQuestion(for type: ActivityType) -> Question? {
        guard var activityQuestions = questions[type], !activityQuestions.isEmpty else { return nil }
        let question = activityQuestions.removeFirst()
        questions[type] = activityQuestions // Update the dictionary after removal
        return question
    }
    
    func peekQuestions(for type: ActivityType) -> [Question] {
        return questions[type] ?? []
    }
    
    func isEmpty(for type: ActivityType) -> Bool {
        return questions[type]?.isEmpty ?? true
    }
}
