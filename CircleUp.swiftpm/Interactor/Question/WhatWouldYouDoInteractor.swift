//
//  WhatWouldYouDoInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 12/02/25.
//

final class WhatWouldYouDoInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .whatWouldYouDo: [
                Question(
                    title: "You wake up and realize everyone in the world has disappeared. What do you do first?",
                    options: [
                        "Raid the nearest luxury store and live like a king.",
                        "Try to find any signs of other people.",
                        "Start securing resources in case this is permanent.",
                        "Have an emotional breakdown."
                    ],
                    insights: [
                        "You embrace chaos and adventure like no other.",
                        "You have a strong need for connection and belonging.",
                        "You’re always thinking ahead and preparing for the worst.",
                        "Your emotions run deep, and you don’t hide it."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Raid the nearest luxury store and live like a king.": [.glitchRebel: 2, .hyperNova: 1],
                        "Try to find any signs of other people.": [.pulseShifter: 2, .luminousOracle: 1],
                        "Start securing resources in case this is permanent.": [.neonVisionary: 2, .midnightMirage: 1],
                        "Have an emotional breakdown.": [.cyberPhantom: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "A scientist offers you a pill that will make you 50% smarter, but you’ll lose all your hair forever. Do you take it?",
                    options: [
                        "Yes, intelligence is worth any price.",
                        "No, I like my hair too much.",
                        "Only if I also get super strength.",
                        "I ask for a free trial first."
                    ],
                    insights: [
                        "You’d sacrifice anything for knowledge.",
                        "You enjoy standing out for your looks.",
                        "You thrive on power and dominance.",
                        "You always try to find the smartest loophole."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Yes, intelligence is worth any price.": [.luminousOracle: 2, .neonVisionary: 1],
                        "No, I like my hair too much.": [.hyperNova: 2, .pulseShifter: 1],
                        "Only if I also get super strength.": [.electricMaverick: 2, .glitchRebel: 1],
                        "I ask for a free trial first.": [.neonVisionary: 2, .cyberPhantom: 1]
                    ]
                ),
                Question(
                    title: "You find a briefcase with $1,000,000 and no identification. What do you do?",
                    options: [
                        "Take the money and disappear.",
                        "Turn it in to the authorities.",
                        "Take a little but leave the rest.",
                        "Try to find out who it belongs to."
                    ],
                    insights: [
                        "You know when to take an opportunity and run.",
                        "You value integrity, even in difficult situations.",
                        "You believe in balance—even when bending the rules.",
                        "Your curiosity always wins over easy decisions."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Take the money and disappear.": [.glitchRebel: 2, .midnightMirage: 1],
                        "Turn it in to the authorities.": [.pulseShifter: 2, .luminousOracle: 1],
                        "Take a little but leave the rest.": [.neonVisionary: 2, .hyperNova: 1],
                        "Try to find out who it belongs to.": [.luminousOracle: 2, .cyberPhantom: 1]
                    ]
                ),
                Question(
                    title: "You can only have one superpower. Which do you choose?",
                    options: [
                        "Invisibility.",
                        "Super strength.",
                        "Mind reading.",
                        "Teleportation."
                    ],
                    insights: [
                        "You move in silence, always watching.",
                        "You believe raw power is the key to everything.",
                        "You’re fascinated by the depths of the human mind.",
                        "You want freedom without limits."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Invisibility.": [.cyberPhantom: 2, .midnightMirage: 1],
                        "Super strength.": [.electricMaverick: 2, .hyperNova: 1],
                        "Mind reading.": [.luminousOracle: 2, .neonVisionary: 1],
                        "Teleportation.": [.pulseShifter: 2, .glitchRebel: 1]
                    ]
                ),
                Question(
                    title: "A genie offers you one wish, but you must pick a random consequence. What do you do?",
                    options: [
                        "Make the wish anyway. It’s worth the risk.",
                        "Try to negotiate with the genie.",
                        "Refuse. This sounds too dangerous.",
                        "Wish for infinite wishes and accept the consequence."
                    ],
                    insights: [
                        "You thrive on risk and excitement.",
                        "You always aim for the best possible deal.",
                        "You don’t mess with things you can’t control.",
                        "You love bending the rules in your favor."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Make the wish anyway. It’s worth the risk.": [.electricMaverick: 2, .hyperNova: 1],
                        "Try to negotiate with the genie.": [.neonVisionary: 2, .luminousOracle: 1],
                        "Refuse. This sounds too dangerous.": [.pulseShifter: 2, .cyberPhantom: 1],
                        "Wish for infinite wishes and accept the consequence.": [.glitchRebel: 2, .midnightMirage: 1]
                    ]
                ),
                Question(
                    title: "You’re offered the chance to live in a simulation where you can have anything you want, but it’s not real. Do you accept?",
                    options: [
                        "Yes, as long as I never remember reality.",
                        "No, real life is more meaningful.",
                        "I’d try it out but keep the option to leave.",
                        "I’d hack the simulation and take control."
                    ],
                    insights: [
                        "You’d embrace the fantasy and never look back.",
                        "You believe reality, no matter how difficult, is important.",
                        "You like to explore without losing control.",
                        "You always look for ways to manipulate the system."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Yes, as long as I never remember reality.": [.cyberPhantom: 2, .pulseShifter: 1],
                        "No, real life is more meaningful.": [.luminousOracle: 2, .neonVisionary: 1],
                        "I’d try it out but keep the option to leave.": [.midnightMirage: 2, .pulseShifter: 1],
                        "I’d hack the simulation and take control.": [.glitchRebel: 2, .electricMaverick: 1]
                    ]
                ),
                Question(
                    title: "You suddenly gain the ability to time travel, but you can only go once. What do you do?",
                    options: [
                        "Go to the future to see what happens.",
                        "Go to the past and change history.",
                        "Stay in the present and live normally.",
                        "Use it to play the stock market."
                    ],
                    insights: [
                        "You’re always thinking about what’s ahead.",
                        "You want to shape history to your advantage.",
                        "You believe in staying grounded in the present.",
                        "You’re all about personal gain and opportunity."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Go to the future to see what happens.": [.luminousOracle: 2, .cyberPhantom: 1],
                        "Go to the past and change history.": [.glitchRebel: 2, .neonVisionary: 1],
                        "Stay in the present and live normally.": [.pulseShifter: 2, .midnightMirage: 1],
                        "Use it to play the stock market.": [.electricMaverick: 2, .hyperNova: 1]
                    ]
                ),
                Question(
                    title: "You receive a mysterious message claiming you're actually living in a simulation and are being watched. What do you do?",
                    options: [
                        "Try to find glitches in reality to prove it.",
                        "Ignore it. Sounds like a prank.",
                        "Ask others if they got the same message.",
                        "Embrace it and start acting like the main character."
                    ],
                    insights: [
                        "You’d be the first person to escape the Matrix.",
                        "You don’t entertain nonsense without proof.",
                        "You always need external validation before acting.",
                        "You’ve secretly believed this your whole life."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Try to find glitches in reality to prove it.": [.glitchRebel: 2, .neonVisionary: 1],
                        "Ignore it. Sounds like a prank.": [.midnightMirage: 2, .pulseShifter: 1],
                        "Ask others if they got the same message.": [.luminousOracle: 2, .hyperNova: 1],
                        "Embrace it and start acting like the main character.": [.hyperNova: 2, .electricMaverick: 1]
                    ]
                ),
                Question(
                    title: "You're given the power to erase one thing from existence forever. What do you erase?",
                    options: [
                        "Greed—too many problems stem from it.",
                        "Fear—imagine a world without hesitation.",
                        "Lies—everyone should know the truth.",
                        "Nothing—tampering with reality is dangerous."
                    ],
                    insights: [
                        "You believe the world needs a moral reset.",
                        "You think bravery is the ultimate force of change.",
                        "You crave absolute clarity, no matter the cost.",
                        "You know that even chaos has a purpose."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Greed—too many problems stem from it.": [.luminousOracle: 2, .pulseShifter: 1],
                        "Fear—imagine a world without hesitation.": [.electricMaverick: 2, .cyberPhantom: 1],
                        "Lies—everyone should know the truth.": [.neonVisionary: 2, .glitchRebel: 1],
                        "Nothing—tampering with reality is dangerous.": [.midnightMirage: 2, .luminousOracle: 1]
                    ]
                ),
                Question(
                    title: "A portal opens in front of you, leading to an unknown world. What do you do?",
                    options: [
                        "Step through immediately. No hesitation.",
                        "Observe it first and test with objects.",
                        "Find a way to close it—too risky.",
                        "Gather a team and explore together."
                    ],
                    insights: [
                        "You were probably an explorer in another life.",
                        "You trust logic and science before action.",
                        "You believe curiosity killed the cat for a reason.",
                        "You know that adventures are better with company."
                    ],
                    type: .whatWouldYouDo,
                    personalityScores: [
                        "Step through immediately. No hesitation.": [.electricMaverick: 2, .hyperNova: 1],
                        "Observe it first and test with objects.": [.neonVisionary: 2, .midnightMirage: 1],
                        "Find a way to close it—too risky.": [.pulseShifter: 2, .luminousOracle: 1],
                        "Gather a team and explore together.": [.hyperNova: 2, .cyberPhantom: 1]
                    ]
                )
            ]
        ])
    }
}
