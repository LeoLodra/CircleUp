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
    private let cardInteractor: CardInteractorProtocol
    
    init(interactor: GameInteractorProtocol, cardInteractor: CardInteractorProtocol) {
        self.interactor = interactor
        self.cardInteractor = cardInteractor
        (interactor as? GameInteractor)?.delegate = self
    }
    
    func setupPlayers(names: [String]) {
        players = names.map { name in
            Player(name: name)
        }
        currentPlayerIndex = 0
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    @MainActor
    func rollRandomActivity() async {
        let allActivities = ActivityType.allCases
        let rollDuration: Double = 2.0
        let interval: Double = 0.1
        let totalRolls = Int(rollDuration / interval)
        
        for i in 0..<totalRolls {
            let currentIndex = i % allActivities.count
            currentActivity = allActivities[currentIndex]
            try? await Task.sleep(nanoseconds: UInt64(interval * 1_000_000_000))
        }
        
        guard let selectedActivity = interactor.getRandomActivity() else {
            currentActivity = nil
            return
        }
        currentActivity = selectedActivity
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        let possibleQuestions = interactor.getAvailableQuestions(for: selectedActivity)
        
        let totalQuestionRolls = Int(1.5 / interval)
        for i in 0..<totalQuestionRolls {
            let questionIndex = i % possibleQuestions.count
            currentQuestion = possibleQuestions[questionIndex]
            try? await Task.sleep(nanoseconds: UInt64(interval * 1_000_000_000))
        }
        
        if let finalQuestion = interactor.getRandomQuestion(for: selectedActivity) {
            if selectedActivity == .mostLikely {
                currentQuestion = Question(
                    title: finalQuestion.title,
                    options: players.map { $0.name },
                    type: finalQuestion.type
                )
            } else {
                currentQuestion = finalQuestion
            }
        }
    }
    
    func nextPlayer() {
        if isReversed {
            currentPlayerIndex = interactor.previousPlayer(currentIndex: currentPlayerIndex, playerCount: players.count)
        } else {
            currentPlayerIndex = interactor.nextPlayer(currentIndex: currentPlayerIndex, playerCount: players.count)
        }
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
    
    
    //
    // Wild Card Effects
    //
    
    private var isReversed = false
    
    func skipCurrentTurn() {
        didEndVoting()
    }
    
    func reverseTurnOrder() {
        isReversed.toggle()
    }
    
    @MainActor
    func swapActivity() async {
        currentActivity = nil
        currentQuestion = nil
        
        await rollRandomActivity()
    }
}
