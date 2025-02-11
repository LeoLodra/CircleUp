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
    
    func rollRandomActivity() async
    func registerVote(playerID: String, choice: String)
    func nextPlayer()
    func resetActivities()
}

protocol CardPresenterProtocol: ObservableObject {
    var currentCard: Card? { get }
    
    func drawCard()
    func saveCard()
}

