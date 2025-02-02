//
//  PresenterProtocol.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

protocol GamePresenterProtocol: ObservableObject {
    var players: [Player] { get }
    var currentPlayer: Player { get }
    var currentCard: Card? { get }
    func drawCard(from deckType: CardType)
    func nextPlayer()
}

protocol QuestionPresenterProtocol: ObservableObject {
    var currentQuestion: Question? { get }
    func fetchQuestion()
    func submitAnswer(choice: String)
}

