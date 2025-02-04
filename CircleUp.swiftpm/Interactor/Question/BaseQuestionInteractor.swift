//
//  BaseQuestionInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


class BaseQuestionInteractor: QuestionInteractorProtocol {
    private var questions: [Question] = []
    
    init(questions: [Question]) {
        self.questions = questions.shuffled()
    }
    
    func fetchQuestion() -> Question? {
        return questions.isEmpty ? nil : questions.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return questions.isEmpty
    }
    
    func processAnswer(for question: Question, choice: String) {
        // Placeholder for answer processing; can be overridden by subclasses
        print("Answer recorded: \(choice) for question: \(question.title)")
    }
}
