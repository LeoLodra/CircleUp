//
//  Activity.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 02/02/25.
//

enum ActivityType: String, CaseIterable {
    case mostLikely = "Most Likely"
    case wouldYouRather = "Would You Rather"
    case quickChallenge = "Quick Challenge" // NOT DONE: Add Timer
    case moodTalk = "Mood Talk"
    case charades = "Charades"
    case whichOne = "Which One?"
    case whatWouldYouDo = "What Would You Do?"
}

struct Activity {
    var type: ActivityType
    var prompt: String
}
