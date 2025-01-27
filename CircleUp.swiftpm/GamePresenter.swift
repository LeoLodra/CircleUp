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
    func drawCard(from deckType: CardType)
    func nextPlayer()
}

enum CardAction {
    case saved, played
}

final class GamePresenter: GamePresenterProtocol {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex: Int = 0
    @Published var currentCard: Card?
    @Published var currentCardAction: CardAction? // Tracks if card is saved or played
    
    private let interactor: GameInteractorProtocol
    
    init(interactor: GameInteractorProtocol) {
        self.interactor = interactor
    }
    
    func setupPlayers(names: [String]) {
        players = names.map { name in
            Player(name: name, points: 10, skills: [.insight: 1, .charisma: 1, .strategy: 1])
        }
        currentPlayerIndex = 0
        currentCard = nil
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    func drawCard(from deckType: CardType) {
        guard let card = interactor.drawCard(from: deckType, for: currentPlayer) else {
            currentCard = nil
            return
        }
        currentCard = card
        currentCardAction = nil
    }
    
    
    func playCard() {
        guard let card = currentCard else { return }
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        interactor.applyCardEffect(card: card, to: &players[playerIndex])
        currentCardAction = .played
        currentCard = nil
    }
    
    func saveCard() {
        guard let card = currentCard else { return }
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        interactor.saveCard(card: card, for: &players[playerIndex])
        currentCardAction = .saved
        currentCard = nil
    }
    
    func playSavedCard(_ card: Card) {
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        interactor.playSavedCard(card: card, for: &players[playerIndex])
    }
    
    func nextPlayer() {
        currentPlayerIndex = interactor.nextPlayer(currentIndex: currentPlayerIndex, playerCount: players.count)
        currentCard = nil
    }
}
