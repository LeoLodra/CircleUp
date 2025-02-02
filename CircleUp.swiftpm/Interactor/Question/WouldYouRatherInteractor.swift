//
//  WouldYouRatherInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class WouldYouRatherInteractor: BaseQuestionInteractor {
    override func processAnswer(for question: Question, choice: String) {
        // Customize how answers are processed for "Would You Rather"
        print("Would You Rather answer: \(choice) logged for question: \(question.title)")
    }
}
