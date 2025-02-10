//
//  InteractorProtocol.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

import Foundation

protocol GameInteractorProtocol {
    func getRandomActivity() -> ActivityType?
    func getAvailableQuestions(for type: ActivityType) -> [Question]
    func getRandomQuestion(for type: ActivityType) -> Question?
    func resetActivities()
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int
    func previousPlayer(currentIndex: Int, playerCount: Int) -> Int
    
    func registerVote(playerID: String, choice: String, totalPlayers: Int)
    func getPlayerName(from id: UUID, players: [Player]) -> String
    func getVotes() -> [String: [UUID]]
    func isPlayerVoted(_ playerID: UUID) -> Bool
}

protocol CardInteractorProtocol {
    func drawCard(for player: Player) -> Card?
    func saveCard(card: Card, for player: inout Player)
    func playSavedCard(card: Card, for player: inout Player)
//    func applyCardEffect(card: Card, to gamePresenter: GamePresenter) async
    func applyCardEffect(card: Card, action: @escaping @MainActor () -> Void)
}

protocol QuestionInteractorProtocol {
    func fetchQuestion() -> Question?
    func processAnswer(for question: Question, choice: String)
}
