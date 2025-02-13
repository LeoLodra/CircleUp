//
//  CardPresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

import Foundation

final class CardPresenter: CardPresenterProtocol {
    @Published var currentCard: Card?
    
    private let interactor: CardInteractorProtocol
    private var gamePresenter: GamePresenter
    
    init(interactor: CardInteractorProtocol, gamePresenter: GamePresenter) {
        self.interactor = interactor
        self.gamePresenter = gamePresenter
    }
    
    func drawCard() {
        guard let card = interactor.drawCard(for: gamePresenter.currentPlayer) else {
            currentCard = nil
            return
        }
        
        currentCard = card
        saveCard()
        gamePresenter.nextPlayer()
    }
    
    func saveCard() {
        guard let card = currentCard else { return }
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        interactor.saveCard(card: card, for: &gamePresenter.players[playerIndex])
        currentCard = nil
    }
    
    @MainActor
    func applyCardEffect(card: Card) {
        interactor.applyCardEffect(card: card) { [weak self] in
            guard let presenter = self?.gamePresenter else { return }
            switch card.effect {
            case .skipTurn:
                presenter.skipCurrentTurn()
            case .reverseOrder:
                presenter.reverseTurnOrder()
            case .swapActivity:
                Task { await presenter.swapActivity() }
            case .teamUp:
                presenter.startPlayerSelection(card: card)
            case .stealWild:
                presenter.startPlayerSelection(card: card)
            }
        }
    }
    
    @MainActor
    func playSavedCard(_ card: Card) {
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        guard let _ = gamePresenter.currentPlayer.hand.firstIndex(where: { $0.id == card.id }) else { return }
        print("Playing saved card: \(card)")
        if gamePresenter.isRolling {
            return
        }
        if card.effect == .swapActivity {
            if gamePresenter.currentQuestion == nil {
                print("There is no question to swap")
                //MARK: Add response in UI or Disable if nil
                return
            }
        }
        applyCardEffect(card: card)
        interactor.playSavedCard(card: card, for: &gamePresenter.players[playerIndex])
    }
}
