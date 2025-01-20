//
//  GamePresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

protocol GamePresenterProtocol: ObservableObject {
    var players: [Player] { get }
    var currentPlayer: Player { get }
    var currentCard: Card? { get }
    func drawCard()
    func nextPlayer()
}

final class GamePresenter: GamePresenterProtocol {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex: Int = 0
    @Published var currentCard: Card?

    private let interactor: GameInteractorProtocol
    
    init(interactor: GameInteractorProtocol) {
        self.interactor = interactor
        setupPlayers()
    }
    
    private func setupPlayers() {
        players = [
            Player(name: "Alice", points: 10, skills: [.insight: 1, .charisma: 1, .strategy: 1]),
            Player(name: "Bob", points: 10, skills: [.insight: 1, .charisma: 1, .strategy: 1]),
        ]
    }
    
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    
    func drawCard() {
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        let card = interactor.drawCard(for: currentPlayer)
        currentCard = card
        interactor.applyCardEffect(card: card, to: &players[playerIndex])
    }
    
    func nextPlayer() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        currentCard = nil
    }
}
