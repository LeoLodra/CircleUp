//
//  GameInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

final class GameInteractor: GameInteractorProtocol {
    private var activityDeck: [ActivityType: [String]] = [:]
    private var usedActivities: [ActivityType: [String]] = [:]
    private var wildCards: [Card] = []
    
    init() {
        generateActivities()
        generateWildCards()
    }
    
    private func generateActivities() {
        activityDeck = [
            .mostLikely: [
                "Who is most likely to forget an important event?",
                "Who is most likely to survive a zombie apocalypse?"
            ],
            .wouldYouRather: [
                "Would you rather always be 10 minutes late or 20 minutes early?",
                "Would you rather have unlimited money or unlimited free time?"
            ],
            .quickChallenge: [
                "Do 10 push-ups!",
                "Try to balance on one foot for 30 seconds."
            ],
            .moodTalk: [
                "Describe your current mood in one word.",
                "What's something that made you happy recently?"
            ],
            .truthOrDare: [
                "Truth: What's your biggest fear?",
                "Dare: Sing a song loudly for 30 seconds!"
            ],
            .sayAnything: [
                "Say the first word that comes to your mind.",
                "Describe your ideal weekend."
            ],
            .charades: [
                "Act out a famous movie scene!",
                "Mimic an animal and let others guess!"
            ]
        ]
        
        usedActivities = activityDeck.mapValues { _ in [] }
    }
    
    func getRandomActivity() -> Activity? {
        let availableTypes = activityDeck.filter { !$0.value.isEmpty }.keys
        guard let randomType = availableTypes.randomElement(),
              let randomPrompt = activityDeck[randomType]?.randomElement() else {
            return nil
        }
        
        activityDeck[randomType]?.removeAll { $0 == randomPrompt }
        usedActivities[randomType]?.append(randomPrompt)
        
        return Activity(type: randomType, prompt: randomPrompt)
    }
    
    func resetActivities() {
        generateActivities()
    }
    
    private func addCards(_ card: Card, count: Int) -> [Card] {
        return Array(repeating: card, count: count)
    }
    
    private func generateWildCards() {
        wildCards = [
            addCards(Card(title: "Boost", description: "Gain 5 points."), count: 3)
        ].flatMap { $0 }.shuffled()
    }
    
    func drawCard(for player: Player) -> Card? {
        guard !wildCards.isEmpty else { return nil }
        return wildCards.removeFirst()
    }
    
//    func applyCardEffect(card: Card, to player: inout Player) {
//        player.points += card.points
//        if let effect = card.skillEffect {
//            player.skills[effect.skillType, default: 0] += effect.value
//        }
//    }
//    
    func saveCard(card: Card, for player: inout Player) {
        player.hand.append(card)
    }
    
    func playSavedCard(card: Card, for player: inout Player) {
        guard let cardIndex = player.hand.firstIndex(where: { $0.id == card.id }) else { return }
//        applyCardEffect(card: card, to: &player)
        player.hand.remove(at: cardIndex)
    }
    
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int {
        return (currentIndex + 1) % playerCount
    }
}

