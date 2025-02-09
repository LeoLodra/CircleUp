//
//  GameInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

protocol GameInteractorDelegate: AnyObject {
    func didEndVoting()
}

final class GameInteractor: GameInteractorProtocol {
    private var activityDeck: [ActivityType: BaseQuestionInteractor] = [:]
    private var usedActivities: [ActivityType: [String]] = [:]
    private var votes: [String: [UUID]] = [:]
    
    weak var delegate: GameInteractorDelegate?
    
    init() {
        generateActivities()
    }
    
    private func generateActivities() {
        activityDeck = [
            .mostLikely: MostLikelyInteractor(questions: [
                Question(
                    title: "Who is most likely to survive a zombie apocalypse?",
                    options: nil,
                    type: .mostLikely
                )
            ]),
            .wouldYouRather: WouldYouRatherInteractor(questions: [
                Question(
                    title: "Would you rather always be 10 minutes late or 20 minutes early?",
                    options: ["10 minutes late", "20 minutes early"],
                    type: .wouldYouRather
                ),
                Question(
                    title: "Would you rather have unlimited money or unlimited time?",
                    options: ["Unlimited Money", "Unlimited Time"],
                    type: .wouldYouRather
                )
            ])
        ]
        usedActivities = activityDeck.mapValues { _ in [] }
    }
    
    func getRandomActivity() -> ActivityType? {
        let availableActivities = activityDeck.filter { !$0.value.isEmpty() }.keys
        return availableActivities.randomElement()
    }
    
    func getAvailableActivities() -> [ActivityType] {
        return Array(activityDeck.keys)
    }
    
    func getRandomQuestion(for type: ActivityType) -> Question? {
        return activityDeck[type]?.fetchQuestion()
    }
    
    func resetActivities() {
        generateActivities()
    }
    
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int {
        return (currentIndex + 1) % playerCount
    }
    
    func registerVote(playerID: String, choice: String, totalPlayers: Int) {
        if let uuid = UUID(uuidString: playerID), !isPlayerVoted(uuid) {
            votes[choice, default: []].append(uuid)
            if isVotingComplete(totalPlayers: totalPlayers) {
                endVoting()
            }
        }
    }
    
    func isVotingComplete(totalPlayers: Int) -> Bool {
        let totalVotes = votes.values.reduce(0) { $0 + $1.count }
        return totalVotes >= totalPlayers
    }
    
    private func endVoting() {
        // Notify presenter via delegate or completion handler
        print("Voting Complete: \(votes)")
        votes.removeAll()
        delegate?.didEndVoting() // Notify the presenter
    }
    
    func getVotes() -> [String: [UUID]] {
        return votes
    }
    
    func isPlayerVoted(_ playerID: UUID) -> Bool {
        return votes.values.flatMap { $0 }.contains(playerID)
    }
    
    func getPlayerName(from id: UUID, players: [Player]) -> String {
        return players.first(where: { $0.id == id })?.name ?? "?"
    }
}
