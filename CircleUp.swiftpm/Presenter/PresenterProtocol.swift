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
    func selectRandomActivity()
    var currentCard: Card? { get }
    func drawCard()
    func nextPlayer()
    func resetActivities()
}

protocol QuestionPresenterProtocol: ObservableObject {
    var currentQuestion: Question? { get }
    func fetchQuestion()
    func submitAnswer(choice: String)
}

