//
//  Question.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

struct Question {
    var id: UUID = UUID()
    var title: String
    var options: [String]?
    var insights: [String]?
    var type: ActivityType
    var personalityScores: [String: [PersonalityType: Int]]?
}
