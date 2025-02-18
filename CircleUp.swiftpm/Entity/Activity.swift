//
//  Activity.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 02/02/25.
//

enum ActivityType: String, CaseIterable {
    case mostLikely = "Most Likely" //Choices
    case wouldYouRather = "Would You Rather" //Choices
    case quickChallenge = "Quick Challenge"
    case moodTalk = "Mood Talk"
    case charades = "Charades"
    case whichOne = "Which One?" //Choices
    case whatWouldYouDo = "What Would You Do?" //Choices
    
    // CHOICES PERSONALITY DONE
    // QUICK Challenge and charades from the total played
    // moodTalk from total / feedback
    // each wildCard
}

struct Activity {
    var type: ActivityType
    var prompt: String
}
