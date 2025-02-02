//
//  QuickQuestionInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class QuickQuestionInteractor: BaseQuestionInteractor {
    override func processAnswer(for question: Question, choice: String) {
        // Customize how answers are processed for "Quick Question"
        print("Quick Question answer: \(choice) logged for question: \(question.title)")
    }
}
