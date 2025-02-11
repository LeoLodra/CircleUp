//
//  WhichOneInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 11/02/25.
//


import Foundation

final class WhichOneInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .whichOne: [
                Question(title: "Which one describes you best?", options: ["Logical Thinker", "Creative Dreamer"], type: .whichOne),
                Question(title: "Which one feels more like home?", options: ["Bustling City", "Quiet Countryside"], type: .whichOne),
                Question(title: "Which one is your vibe?", options: ["Carefree Adventurer", "Meticulous Planner"], type: .whichOne),
                Question(title: "Which one would people say about you?", options: ["Always Early", "Always Late"], type: .whichOne),
                Question(title: "Which one matches your social style?", options: ["Life of the Party", "Deep Conversations Only"], type: .whichOne),
                Question(title: "Which one is more appealing?", options: ["Endless Knowledge", "Endless Creativity"], type: .whichOne),
                Question(title: "Which one do you rely on more?", options: ["Intuition", "Logic"], type: .whichOne),
                Question(title: "Which one is your ideal way to relax?", options: ["Binge-Watching Shows", "Reading a Book"], type: .whichOne),
                Question(title: "Which one fits your decision-making style?", options: ["Go With the Flow", "Plan Everything"], type: .whichOne),
                Question(title: "Which one do you secretly wish for?", options: ["More Time", "More Money"], type: .whichOne)
            ]
        ])
    }
}
