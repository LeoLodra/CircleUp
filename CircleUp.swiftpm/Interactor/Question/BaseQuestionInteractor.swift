//
//  BaseQuestionInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


import Foundation

class BaseQuestionInteractor {
    private var questions: [ActivityType: [Question]] = [:]
    
    init(questions: [ActivityType: [Question]]) {
        self.questions = questions
    }
    
    func fetchQuestion(for type: ActivityType) -> Question? {
        guard var activityQuestions = questions[type], !activityQuestions.isEmpty else { return nil }
        let randomIndex = Int.random(in: 0..<activityQuestions.count)
        let question = activityQuestions.remove(at: randomIndex)
        questions[type] = activityQuestions
        return question
    }
    
    func peekQuestions(for type: ActivityType) -> [Question] {
        return questions[type] ?? []
    }
    
    func isEmpty(for type: ActivityType) -> Bool {
        return questions[type]?.isEmpty ?? true
    }
}
