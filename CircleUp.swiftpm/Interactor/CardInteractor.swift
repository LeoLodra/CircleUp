//
//  CardInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

final class CardInteractor: CardInteractorProtocol {
    private var wildCards: [Card] = []
    
    init() {
        generateWildCards()
    }
    
    private func addCards(_ card: Card, count: Int) -> [Card] {
        return Array(repeating: card, count: count)
    }
    
    private func generateWildCards() {
        wildCards = [
            addCards(Card(title: "Skip", description: "Skip your turn", effect: .skipTurn), count: 5),
            addCards(Card(title: "Reverse", description: "Reverse turn order", effect: .reverseOrder), count: 5),
            addCards(Card(title: "Swap", description: "Change the current question / activity", effect: .swapActivity), count: 5),
            addCards(Card(title: "Steal", description: "Steal a random wild card from a player", effect: .stealWild), count: 5),
            addCards(Card(title: "TeamUp", description: "Team up for a challenge with a player of your choice", effect: .teamUp), count: 5)
        ].flatMap { $0 }.shuffled()
    }
    
    func drawCard(for player: Player) -> Card? {
        guard !wildCards.isEmpty else { return nil }
        return wildCards.removeFirst()
    }
    
    func applyCardEffect(card: Card, action: @escaping @MainActor () -> Void) {
            Task { @MainActor in
                action()
            }
        }
    
    func saveCard(card: Card, for player: inout Player) {
        if player.hand.count < 2 { // Prevent hoarding
            player.hand.append(card)
        }
    }
    
    func playSavedCard(card: Card, for player: inout Player) {
        guard let cardIndex = player.hand.firstIndex(where: { $0.id == card.id }) else { return }
        player.hand.remove(at: cardIndex)
    }
}

