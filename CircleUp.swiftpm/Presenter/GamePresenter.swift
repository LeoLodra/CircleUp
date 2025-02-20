//
//  GamePresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation
import SwiftUICore

final class GamePresenter: GamePresenterProtocol, GameInteractorDelegate {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex: Int = 0
    @Published var currentActivity: ActivityType?
    @Published var currentQuestion: Question?
    
    @Published var isRolling: Bool = false
    @Published var turnDone: Bool = false
    @Published var feedback: Bool = false
    @Published var showEndGameConfirmation: Bool = false
    @Published var teammate: Player? = nil
    
    @Published var votes: [String: [UUID]] = [:]
    
    private let interactor: GameInteractorProtocol
    private let cardInteractor: CardInteractorProtocol
    
    init(interactor: GameInteractorProtocol, cardInteractor: CardInteractorProtocol) {
        self.interactor = interactor
        self.cardInteractor = cardInteractor
        (interactor as? GameInteractor)?.delegate = self
    }
    
    func setupPlayers(names: [String], colors: [Color]) {
        players = zip(names, colors).map { name, color in
            Player(name: name, color: color)
        }
        currentPlayerIndex = 0
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    @MainActor
    func rollRandomActivity() async {
        isRolling = true
        let allActivities = ActivityType.allCases
        let rollDuration: Double = 1.0
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
            isRolling = false
            if selectedActivity == .mostLikely {
                currentQuestion = Question(
                    title: finalQuestion.title,
                    options: players.map { $0.name },
                    type: finalQuestion.type,
                    personalityScores: finalQuestion.personalityScores
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
        // Add personality scores for each player's choice
        guard let uuid = UUID(uuidString: playerID),
              let question = currentQuestion,
              let playerIndex = players.firstIndex(where: { $0.id == uuid }) else { return }
        
        if currentActivity == .whatWouldYouDo || currentActivity == .wouldYouRather || currentActivity == .whichOne || currentActivity == .mostLikely {
            interactor.registerVote(playerID: playerID, choice: choice, totalPlayers: players.count)
            if currentActivity != .mostLikely {
                players[playerIndex].addPersonalityPoints(for: choice, from: question)
            }
        } else {
            giveFeedback(playerIndex: playerIndex, choice: choice)
            interactor.registerVote(playerID: playerID, choice: choice, totalPlayers: 1)
        }
        
        self.votes = interactor.getVotes() // Sync votes from interactor
    }
    
    func didEndVoting() {
        turnDone = true
    }
    
    func endTurn() {
        if currentActivity == .mostLikely {
            determineMostVoted()
        }
        
        currentActivity = nil
        currentQuestion = nil
        turnDone = false
        feedback = false
        teammate = nil
        
        votes.removeAll()
        interactor.clearVotes()
        
        nextPlayer()
    }
    
    private func determineMostVoted() {
        guard let currentQuestion = currentQuestion, !votes.isEmpty else { return }
        
        let voteCounts = votes.mapValues { $0.count }
        let maxVotes = voteCounts.values.max()
        
        let mostVotedPlayers = voteCounts
            .filter { $0.value == maxVotes }
            .map { $0.key }
        
        if !mostVotedPlayers.isEmpty {
            if let personalityScores = currentQuestion.personalityScores?["default"] {
                for playerName in mostVotedPlayers {
                    if let playerIndex = players.firstIndex(where: { $0.name == playerName }) {
                        for (trait, points) in personalityScores {
                            players[playerIndex].personalityScores[trait, default: 0] += points
                        }
                    }
                }
            }
        }
    }
    
    private func giveFeedback(playerIndex: Int, choice: String) {
        if currentActivity == .charades {
            if choice == "Acted out with full energy" {
                players[playerIndex].personalityScores[.hyperNova, default: 0] += 2
                players[playerIndex].personalityScores[.electricMaverick, default: 0] += 1
            } else if choice == "Minimal effort, reluctant" {
                players[playerIndex].personalityScores[.midnightMirage, default: 0] += 2
                players[playerIndex].personalityScores[.cyberPhantom, default: 0] += 1
            }
        } else if currentActivity == .moodTalk {
            if choice == "Open and deep response" {
                players[playerIndex].personalityScores[.luminousOracle, default: 0] += 2
                players[playerIndex].personalityScores[.hyperNova, default: 0] += 1
            } else if choice == "Kept it vague or dodged" {
                players[playerIndex].personalityScores[.cyberPhantom, default: 0] += 2
                players[playerIndex].personalityScores[.pulseShifter, default: 0] += 1
            }
        } else if currentActivity == .quickChallenge {
            if choice == "Completed with confidence" {
                players[playerIndex].personalityScores[.electricMaverick, default: 0] += 2
                players[playerIndex].personalityScores[.glitchRebel, default: 0] += 1
            } else if choice == "Struggled or refused" {
                players[playerIndex].personalityScores[.midnightMirage, default: 0] += 2
                players[playerIndex].personalityScores[.neonVisionary, default: 0] += 1
            }
        }
    }
    
    func getPlayer(from id: UUID) -> Player {
        return interactor.getPlayer(from: id, players: players)
    }
    
    //
    // Wild Card Effects
    //
    
    private var isReversed = false
    
    func skipCurrentTurn() {
        players[currentPlayerIndex].personalityScores[.midnightMirage, default: 0] += 2
        players[currentPlayerIndex].personalityScores[.cyberPhantom, default: 0] += 1
        
        endTurn()
    }
    
    func reverseTurnOrder() {
        players[currentPlayerIndex].personalityScores[.glitchRebel, default: 0] += 2
        players[currentPlayerIndex].personalityScores[.pulseShifter, default: 0] += 1
        
        isReversed.toggle()
    }
    
    @MainActor
    func swapActivity() async {
        players[currentPlayerIndex].personalityScores[.pulseShifter, default: 0] += 2
        players[currentPlayerIndex].personalityScores[.neonVisionary, default: 0] += 1
        
        currentActivity = nil
        currentQuestion = nil
        
        await rollRandomActivity()
    }
    
    @Published var selectPlayerFor: CardEffect?
    func startPlayerSelection(card: Card) {
        if card.effect == .teamUp {
            selectPlayerFor = .teamUp
        } else if card.effect == .stealWild {
            selectPlayerFor = .stealWild
        }
    }
    
    func teamUp(with player: Player) {
        players[currentPlayerIndex].personalityScores[.hyperNova, default: 0] += 2
        players[currentPlayerIndex].personalityScores[.luminousOracle, default: 0] += 1
        
        teammate = player
        selectPlayerFor = nil
    }
    
    func stealWildCard(from player: Player) {
        players[currentPlayerIndex].personalityScores[.cyberPhantom, default: 0] += 2
        players[currentPlayerIndex].personalityScores[.electricMaverick, default: 0] += 1
        
        guard let stolenCardIndex = player.hand.firstIndex(where: { _ in true }),
              let victimIndex = players.firstIndex(where: { $0.id == player.id }),
              let thiefIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else {
            return
        }
        
        let stolenCard = players[victimIndex].hand.remove(at: stolenCardIndex)
        players[thiefIndex].hand.append(stolenCard)
        selectPlayerFor = nil
    }
    
    func resetGame() {
        players.removeAll()
        currentPlayerIndex = 0

        interactor.resetActivities()
        
        votes.removeAll()
        turnDone = false
        feedback = false
        currentActivity = nil
        currentQuestion = nil
        teammate = nil
        
        (cardInteractor as? CardInteractor)?.generateWildCards()
    }

}
