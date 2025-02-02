//
//  QuestionPresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

final class QuestionPresenter: QuestionPresenterProtocol {
    @Published var currentQuestion: Question?
    
    private let interactor: QuestionInteractorProtocol

    init(interactor: QuestionInteractorProtocol) {
        self.interactor = interactor
    }

    func fetchQuestion() {
        currentQuestion = interactor.fetchQuestion()
    }

    func submitAnswer(choice: String) {
        guard let question = currentQuestion else { return }
        interactor.processAnswer(for: question, choice: choice)
        fetchQuestion() // Load the next question
    }
}
