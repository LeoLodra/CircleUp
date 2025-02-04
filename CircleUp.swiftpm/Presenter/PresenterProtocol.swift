//
//  PresenterProtocol.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

protocol GamePresenterProtocol: ObservableObject {
    var players: [Player] { get }
//    var currentPlayer: Player { get }
    func selectRandomActivity()
//    func registerVote(for choice: String)
//    func startRollingActivity()
    func nextPlayer()
    func resetActivities()
    
    var currentCard: Card? { get }
    func drawCard()
}

//protocol CardPresenterProtocol: ObservableObject {
//    var currentCard: Card? { get }
//    func drawCard()
//}

protocol QuestionPresenterProtocol: ObservableObject {
    var currentQuestion: Question? { get }
    func fetchQuestion()
    func submitAnswer(choice: String)
}

