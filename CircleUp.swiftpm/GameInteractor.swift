//
//  GameInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//


protocol GameInteractorProtocol {
    func drawCard(for player: Player) -> Card
    func applyCardEffect(card: Card, to player: inout Player)
}

final class GameInteractor: GameInteractorProtocol {
    private var deck: [Card] = []
    
    init() {
        generateDeck()
    }
    
    private func generateDeck() {
        deck = [
            Card(type: .strategy, title: "Boost", description: "Gain 5 points.", points: 5, skillEffect: nil),
            Card(type: .personal, title: "Trivia", description: "Answer a group question.", points: 3, skillEffect: nil),
            Card(type: .wildcard, title: "Random Event", description: "Lose 3 points.", points: -3, skillEffect: nil),
            // Add more cards as needed
        ]
    }
    
    func drawCard(for player: Player) -> Card {
        if deck.isEmpty {
            generateDeck()
        }
        return deck.removeFirst()
    }
    
    func applyCardEffect(card: Card, to player: inout Player) {
        player.points += card.points
        if let effect = card.skillEffect {
            player.skills[effect.skillType, default: 0] += effect.value
        }
    }
}
