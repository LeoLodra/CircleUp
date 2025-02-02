//
//  GameInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

final class GameInteractor: GameInteractorProtocol {
    private var strategyDeck: [Card] = []
    private var personalDeck: [Card] = []
    private var wildcardDeck: [Card] = []
    
    init() {
        generateDecks()
    }
    
    private func addCards(_ card: Card, count: Int) -> [Card] {
        return Array(repeating: card, count: count)
    }
    
    private func generateDecks() {
        strategyDeck = [
            addCards(Card(type: .strategy, title: "Boost", description: "Gain 5 points.", points: 5, skillEffect: nil), count: 3)
        ].flatMap { $0 }.shuffled()
        
        personalDeck = [
            addCards(Card(type: .personal, title: "Trivia", description: "Answer a group question.", points: 3, skillEffect: nil), count: 2)
        ].flatMap { $0 }.shuffled()
        
        wildcardDeck = [
            addCards(Card(type: .wildcard, title: "Random Event", description: "Lose 3 points.", points: -3, skillEffect: nil), count: 1)
        ].flatMap { $0 }.shuffled()
    }
    
    func drawCard(from deckType: CardType, for player: Player) -> Card? {
        switch deckType {
        case .strategy:
            guard !strategyDeck.isEmpty else { return nil }
            return strategyDeck.removeFirst()
        case .personal:
            guard !personalDeck.isEmpty else { return nil }
            return personalDeck.removeFirst()
        case .wildcard:
            guard !wildcardDeck.isEmpty else { return nil }
            return wildcardDeck.removeFirst()
        }
    }
    
    func applyCardEffect(card: Card, to player: inout Player) {
        player.points += card.points
        if let effect = card.skillEffect {
            player.skills[effect.skillType, default: 0] += effect.value
        }
    }
    
    func saveCard(card: Card, for player: inout Player) {
        player.hand.append(card)
    }
    
    func playSavedCard(card: Card, for player: inout Player) {
        guard let cardIndex = player.hand.firstIndex(where: { $0.id == card.id }) else { return }
        applyCardEffect(card: card, to: &player)
        player.hand.remove(at: cardIndex)
    }
    
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int {
        return (currentIndex + 1) % playerCount
    }
}

