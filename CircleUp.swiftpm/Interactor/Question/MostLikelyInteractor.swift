//
//  MostLikelyInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class MostLikelyInteractor: BaseQuestionInteractor {
    override func processAnswer(for question: Question, choice: String) {
        // Customize how answers are processed for "Most Likely"
        print("Most Likely answer: \(choice) logged for question: \(question.title)")
    }
}
