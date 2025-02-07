//
//  CardPresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

import Foundation

enum CardAction {
    case saved, played
}

final class CardPresenter: CardPresenterProtocol {
    @Published var currentCard: Card?
    @Published var currentCardAction: CardAction? // Tracks if card is saved or played
    
    private let interactor: CardInteractorProtocol
    
    private var gamePresenter: GamePresenter // Reference the main game presenter

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
        currentCardAction = nil
        saveCard()
    }
    
    
    //    func playCard() {
    //        guard let card = currentCard else { return }
    //        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
    //        interactor.applyCardEffect(card: card, to: &players[playerIndex])
    //        currentCardAction = .played
    //        currentCard = nil
    //    }
    //
    func saveCard() {
        guard let card = currentCard else { return }
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        interactor.saveCard(card: card, for: &gamePresenter.players[playerIndex])
        currentCardAction = .saved
        currentCard = nil
    }
    
    func playSavedCard(_ card: Card) {
        guard let playerIndex = gamePresenter.players.firstIndex(where: { $0.id == gamePresenter.currentPlayer.id }) else { return }
        interactor.playSavedCard(card: card, for: &gamePresenter.players[playerIndex])
    }
}
