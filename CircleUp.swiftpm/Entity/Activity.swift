//
//  Activity.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 02/02/25.
//

enum ActivityType: String, CaseIterable {
    case mostLikely = "Most Likely"
    case wouldYouRather = "Would You Rather"
//    case quickChallenge = "Quick Challenge"
//    case moodTalk = "Mood Talk"
//    case truthOrDare = "Truth or Dare"
//    case sayAnything = "Say Anything"
//    case charades = "Charades"
}

struct Activity {
    let type: ActivityType
    let prompt: String
}
