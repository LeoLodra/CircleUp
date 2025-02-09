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
            addCards(Card(title: "Skip", description: "Skip your turn", effect: .skipTurn), count: 2),
            addCards(Card(title: "Immunity", description: "Ignore a question / activity", effect: .ignoreActivity), count: 2),
            addCards(Card(title: "Reverse Order", description: "Reverse turn order", effect: .reverseOrder), count: 2),
            addCards(Card(title: "Swap", description: "Change the current question / activity", effect: .swapQuestion), count: 2)
        ].flatMap { $0 }.shuffled()
    }
    
    func drawCard(for player: Player) -> Card? {
        guard !wildCards.isEmpty else { return nil }
        return wildCards.removeFirst()
    }
    
    func applyCardEffect(card: Card, to gamePresenter: GamePresenter) {
            switch card.effect {
            case .skipTurn:
                gamePresenter.skipCurrentTurn()
            case .ignoreActivity:
                gamePresenter.grantImmunity()
            case .reverseOrder:
                gamePresenter.reverseTurnOrder()
            case .swapQuestion:
                gamePresenter.swapQuestion()
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

