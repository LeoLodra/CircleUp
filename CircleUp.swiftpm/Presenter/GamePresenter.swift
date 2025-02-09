//
//  GamePresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

final class GamePresenter: GamePresenterProtocol, GameInteractorDelegate {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex: Int = 0
    @Published var currentActivity: ActivityType?
    @Published var currentQuestion: Question?
    
    @Published var votes: [String: [UUID]] = [:]
    
    private let interactor: GameInteractorProtocol
    
    init(interactor: GameInteractorProtocol) {
        self.interactor = interactor
        (interactor as? GameInteractor)?.delegate = self
    }
    
    func setupPlayers(names: [String]) {
        players = names.map { name in
            Player(name: name)
        }
        currentPlayerIndex = 0
        //        currentCard = nil
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    func selectRandomActivity() {
        guard let activity = interactor.getRandomActivity(), let question = interactor.getRandomQuestion(for: activity) else {
            currentActivity = nil
            currentQuestion = nil
            return
        }
        
        if activity == .mostLikely {
            currentQuestion = Question(
                title: question.title,
                options: players.map { $0.name },
                type: question.type
            )
        } else {
            currentQuestion = question
        }
        
        currentActivity = activity
    }
    
    func nextPlayer() {
        currentPlayerIndex = interactor.nextPlayer(currentIndex: currentPlayerIndex, playerCount: players.count)
        //        currentCard = nil
    }
    
    func resetActivities() {
        interactor.resetActivities()
    }
    
    func isPlayerVoted(_ playerID: UUID) -> Bool {
        return interactor.isPlayerVoted(playerID)
    }
    
    func registerVote(playerID: String, choice: String) {
        interactor.registerVote(playerID: playerID, choice: choice, totalPlayers: players.count)
        self.votes = interactor.getVotes() // Sync votes from interactor
    }
    
    func didEndVoting() {
        currentActivity = nil
        currentQuestion = nil
        nextPlayer()
    }
    
    func getPlayerName(from id: UUID) -> String {
        return interactor.getPlayerName(from: id, players: players)
    }
}
