//
//  GameInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

final class GameInteractor: GameInteractorProtocol {
    private var activityDeck: [ActivityType: BaseQuestionInteractor] = [:]
    private var usedActivities: [ActivityType: [String]] = [:]
    private var wildCards: [Card] = []
    
    init() {
        generateActivities()
        generateWildCards()
    }
    
    private func generateActivities() {
        activityDeck = [
            .mostLikely: MostLikelyInteractor(questions: [
                Question(
                    title: "Who is most likely to survive a zombie apocalypse?",
                    options: nil,
                    type: .mostLikely
                )
            ]),
            .wouldYouRather: WouldYouRatherInteractor(questions: [
                Question(
                    title: "Would you rather always be 10 minutes late or 20 minutes early?",
                    options: ["10 minutes late", "20 minutes early"],
                    type: .wouldYouRather
                ),
                Question(
                    title: "Would you rather have unlimited money or unlimited time?",
                    options: ["Unlimited Money", "Unlimited Time"],
                    type: .wouldYouRather
                )
            ])
        ]
        
        usedActivities = activityDeck.mapValues { _ in [] }
    }
    
    func getRandomActivity() -> ActivityType? {
        let availableActivities = activityDeck.filter { !$0.value.isEmpty() }.keys
        return availableActivities.randomElement()
    }
    
    func getRandomQuestion(for type: ActivityType) -> Question? {
        return activityDeck[type]?.fetchQuestion()
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

