//
//  PlayerPersonalityView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 18/02/25.
//

import SwiftUI

struct PlayerPersonalityView: View {
    var players: [Player]
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                Text("Player Personalities")
                    .font(.custom("Chalkboard SE", size: 34))
                    .foregroundColor(.lightText)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                TabView(selection: $selectedIndex) {
                    ForEach(players.indices, id: \..self) { index in
                        let player = players[index]
                        let personalityType = player.calculatePersonalityType()
                        let personalityDetails = getPersonalityDetails(for: personalityType)
                        
                        HStack(spacing: 20) {
                            Image(personalityType.rawValue) // Assumes assets named after personality type
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Circle()
                                        .fill(player.color)
                                        .frame(width: 20, height: 20)
                                    Text(player.name)
                                        .font(.custom("Chalkboard SE", size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(.lightText)
                                }
                                
                                Text(personalityType.rawValue.capitalized)
                                    .font(.custom("Chalkboard SE", size: 24))
                                    .foregroundColor(.lightText)
                                
                                Text(personalityDetails.description)
                                    .font(.custom("Chalkboard SE", size: 22))
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.leading)
                                
                                traitSection(title: "Strengths", traits: personalityDetails.strengths, icon: "bolt.fill", color: .green)
                                traitSection(title: "Weaknesses", traits: personalityDetails.weaknesses, icon: "exclamationmark.triangle.fill", color: .red)
                                
                                Text("\(personalityDetails.catchphrase)")
                                    .font(.custom("Chalkboard SE", size: 18))
                                    .foregroundColor(.white.opacity(0.8))
                                    .italic()
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            
                            VStack {
                                Text("\(personalityDetails.idealPlaystyle)")
                                    .font(.custom("Chalkboard SE", size: 18))
                                    .foregroundColor(.white.opacity(0.8))
                                Text("\(personalityDetails.worstNightmare)")
                                    .font(.custom("Chalkboard SE", size: 18))
                                    .foregroundColor(.white.opacity(0.8))
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                        }
                        .padding()
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.7)
                .background(Color.backgroundSecondary)
                
                HStack {
                    Button(action: {
                        if selectedIndex > 0 { selectedIndex -= 1 }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(selectedIndex > 0 ? Color.buttonBlue : Color.buttonDisabled)
                            .clipShape(Circle())
                    }
                    .disabled(selectedIndex == 0)
                    
                    Spacer()
                    
                    Button(action: {
                        if selectedIndex < players.count - 1 { selectedIndex += 1 }
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(selectedIndex < players.count - 1 ? Color.buttonBlue : Color.buttonDisabled)
                            .clipShape(Circle())
                    }
                    .disabled(selectedIndex == players.count - 1)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
            }
        }
    }
    
    private func traitSection(title: String, traits: [String], icon: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            ForEach(traits, id: \..self) { trait in
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white.opacity(0.8))
                    Text(trait)
                        .foregroundColor(.white.opacity(0.9))
                        .font(.body)
                }
            }
        }
    }
}

extension PlayerPersonalityView {
    private func getPersonalityDetails(for type: PersonalityType) -> (
        description: String,
        strengths: [String],
        weaknesses: [String],
        idealPlaystyle: String,
        catchphrase: String,
        worstNightmare: String,
        strongRelationship: PersonalityType,
        weakRelationship: PersonalityType
    ) {
        switch type {
        case .cyberPhantom:
            return (
                "The Enigmatic Trickster",
                ["Keeps others guessing", "Bold and fearless", "Strategic"],
                ["Can seem distant", "Overthinks decisions"],
                "Lurks in the background, waiting for the perfect moment to strike.",
                "“You saw me? No, you didn’t.”",
                "Being forced into the spotlight with no escape plan.",
                .pulseShifter, // Adapts to their unpredictability
                .hyperNova // Too loud and attention-seeking for them
            )
        case .electricMaverick:
            return (
                "The Daredevil",
                ["Thrill-seeker", "Inspires excitement", "Takes big risks"],
                ["Can be reckless", "Clashes with cautious players"],
                "Plays at full speed, thrives in chaos, and always goes big.",
                "“No risk, no reward!”",
                "A slow, methodical game where nothing exciting happens.",
                .hyperNova, // Shares their high energy
                .luminousOracle // Overthinks everything, ruining their fun
            )
        case .luminousOracle:
            return (
                "The Deep Thinker",
                ["Sees deeper meanings", "Good at predicting outcomes", "Thoughtful and strategic"],
                ["Overanalyzes", "Hesitates under pressure"],
                "Prefers careful planning, strategy, and seeing all possibilities before acting.",
                "“Patience wins wars.”",
                "A sudden change of plans that ruins their careful setup.",
                .neonVisionary, // Respects their strategic mind
                .glitchRebel // Breaks all their carefully planned rules
            )
        case .glitchRebel:
            return (
                "The Rule-Breaker",
                ["Finds loopholes", "Creative problem-solver", "Challenges the norm"],
                ["Disrupts team dynamics", "Can frustrate structured players"],
                "Plays by their own rules, bending mechanics in unexpected ways.",
                "“Let’s see what happens if I do this…”",
                "Being forced to follow strict rules with no wiggle room.",
                .pulseShifter, // Loves their unpredictability
                .neonVisionary // Too structured for them
            )
        case .neonVisionary:
            return (
                "The Mastermind",
                ["Plans ahead", "Manipulates mechanics to advantage", "Logical and effective"],
                ["Overly cautious", "Dislikes chaotic play"],
                "Calculates every move, always five steps ahead.",
                "“Everything is going according to plan.”",
                "Someone who throws the game into chaos with no logic.",
                .luminousOracle, // Appreciates their strategic thinking
                .electricMaverick // Too reckless and impulsive
            )
        case .hyperNova:
            return (
                "The Life of the Party",
                ["Brings energy", "Natural leader", "Socially adaptable"],
                ["Overly competitive", "Lacks patience"],
                "Brings the hype, keeps the game alive, and always makes things fun.",
                "“LET’S GOOOOO!”",
                "Silence. Awkward, dead silence.",
                .electricMaverick, // Matches their energy
                .midnightMirage // Too quiet and distant
            )
        case .midnightMirage:
            return (
                "The Silent Observer",
                ["Calm and composed", "Hard to read", "Emotionally controlled"],
                ["Seems detached", "Can be too passive"],
                "Watches from the shadows, stepping in only when necessary.",
                "“…”",
                "Being put on the spot and forced to react.",
                .luminousOracle, // Respects their quiet wisdom
                .hyperNova // Too loud and overwhelming
            )
        case .pulseShifter:
            return (
                "The Ultimate Adaptor",
                ["Adjusts to any situation", "Understands strategy shifts", "Keeps opponents guessing"],
                ["Lacks clear identity", "Struggles with consistency"],
                "Constantly changes their approach, never playing the same way twice.",
                "“I’ll go with the flow.”",
                "Being forced into a strict role with no flexibility.",
                .glitchRebel, // Appreciates their unpredictable nature
                .neonVisionary // Too structured and rigid
            )
        }
    }
}
