//
//  CardPresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

import Foundation

final class CardPresenter: CardPresenterProtocol {
    @Published var currentCard: Card?
//    @Published var currentCardAction: CardAction?
    
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
        print("card", currentCard)
        saveCard()
    }

    func saveCard() {
        guard let card = currentCard else { return }
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        interactor.saveCard(card: card, for: &gamePresenter.players[playerIndex])
        currentCard = nil
    }

    func playSavedCard(_ card: Card) {
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        interactor.applyCardEffect(card: card, to: gamePresenter)
        interactor.playSavedCard(card: card, for: &gamePresenter.players[playerIndex])
    }
}
