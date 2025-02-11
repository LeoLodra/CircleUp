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
                        "You were probably a pirate in a past life.",
                        "You would survive exactly one episode of a horror movie.",
                        "You're the type of person who keeps a go-bag just in case.",
                        "You cry when a song reminds you of your childhood."
                    ],
                    type: .whatWouldYouDo
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
                        "You would 100% become a mad scientist given the chance.",
                        "You're secretly vain but won’t admit it.",
                        "You think life is just one big superhero origin story.",
                        "You have commitment issues even with shampoo."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You find a mysterious button. Pressing it will give you $1,000,000, but someone you don’t know will disappear. What do you do?",
                    options: [
                        "Press it immediately, no hesitation.",
                        "Refuse to press it, too risky.",
                        "Press it but feel guilty afterward.",
                        "Try to hack the button and see how it works."
                    ],
                    insights: [
                        "You would absolutely survive in a dystopian society.",
                        "You have a deep fear of bad karma.",
                        "Your moral compass only works at certain times of the day.",
                        "You're the kind of person who reads the terms and conditions."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You get stranded on a deserted island. What’s your first move?",
                    options: [
                        "Find food and water immediately.",
                        "Build a giant SOS signal.",
                        "Explore the island for potential dangers.",
                        "Accept your fate and start a new life as ‘island person’."
                    ],
                    insights: [
                        "You’re basically the main character in every survival movie.",
                        "You secretly want to be famous for something dramatic.",
                        "Your curiosity will either make you a genius or get you in trouble.",
                        "You’re the type who would name a volleyball Wilson."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "A mysterious old man offers you a red potion and a blue potion. Which one do you drink?",
                    options: [
                        "Red—power and strength sound good.",
                        "Blue—wisdom and knowledge are more important.",
                        "Neither—I don't trust free potions.",
                        "Both—what’s the worst that could happen?"
                    ],
                    insights: [
                        "You'd 100% try to become a superhero if given the chance.",
                        "You secretly think you're the smartest person in the room.",
                        "You have trust issues but for good reason.",
                        "You are the chaos friend in your group."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You wake up as a millionaire, but all your memories are gone. What do you do?",
                    options: [
                        "Enjoy the money—who needs memories?",
                        "Try to find out who you were before.",
                        "Give away the money to see who reacts.",
                        "Start over and build a new life from scratch."
                    ],
                    insights: [
                        "You’d do well in witness protection.",
                        "You probably overthink every small decision.",
                        "You have main character energy and love a good drama.",
                        "You were either a philosopher or a con artist in a past life."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You get to live in any fictional world for a year. Where do you go?",
                    options: [
                        "A world with magic and wizards.",
                        "A futuristic city with advanced technology.",
                        "A peaceful, cozy fantasy village.",
                        "A wild, chaotic action-movie world."
                    ],
                    insights: [
                        "You would absolutely abuse your magic powers.",
                        "You wish you were born in the future so badly.",
                        "You secretly just want to be a farmer and live in peace.",
                        "You have a ‘dangerously optimistic’ approach to life."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You win a ticket to go to space, but there’s a 10% chance of failure. Do you go?",
                    options: [
                        "Yes, I’ve always wanted to see space.",
                        "No way, that’s too risky.",
                        "Only if I get to bring my pet.",
                        "I sell my ticket to the highest bidder."
                    ],
                    insights: [
                        "You were an astronaut in a past life (probably).",
                        "You’re definitely the person who checks if the door is locked 5 times.",
                        "You have an emotional support animal and no shame about it.",
                        "You’d rather be rich than famous—smart move."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You wake up in a video game world. What’s your first instinct?",
                    options: [
                        "Find weapons and prepare for battle.",
                        "Explore and talk to all the NPCs.",
                        "Try to figure out the game mechanics.",
                        "Go on a side quest and ignore the main story."
                    ],
                    insights: [
                        "You’re either a hero or a villain—no in-between.",
                        "You have way too much fun in open-world games.",
                        "You would 100% min-max every part of your life.",
                        "You have commitment issues, even in virtual worlds."
                    ],
                    type: .whatWouldYouDo
                ),

                Question(
                    title: "You’re given a time machine, but you can only use it once. What do you do?",
                    options: [
                        "Go to the past and fix a mistake.",
                        "Go to the future and see what happens.",
                        "Sell it to a billionaire.",
                        "Destroy it—time travel is too dangerous."
                    ],
                    insights: [
                        "You stay up at night thinking about your past choices.",
                        "You have a deep fear of missing out.",
                        "You're lowkey a business genius.",
                        "You’ve watched way too many sci-fi movies."
                    ],
                    type: .whatWouldYouDo
                )
            ]
        ])
    }
}
