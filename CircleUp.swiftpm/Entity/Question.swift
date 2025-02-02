//
//  Question.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

struct Question {
    let id: UUID
    let title: String
    let options: [String] // Multiple choices for the question
    let type: QuestionType
}

enum QuestionType {
    case wouldYouRather
    case mostLikely
    case quickQuestion
}
