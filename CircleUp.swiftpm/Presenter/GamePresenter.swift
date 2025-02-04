//
//  GamePresenter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation

enum CardAction {
    case saved, played
}

final class GamePresenter: GamePresenterProtocol {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex: Int = 0
    @Published var currentActivity: ActivityType?
    @Published var currentQuestion: Question?
    @Published var currentCard: Card?
    @Published var currentCardAction: CardAction? // Tracks if card is saved or played
    
    @Published var votes: [String: [UUID]] = [:]
    
    private let interactor: GameInteractorProtocol
    
    init(interactor: GameInteractorProtocol) {
        self.interactor = interactor
    }
    
    func setupPlayers(names: [String]) {
        players = names.map { name in
            Player(name: name)
        }
        currentPlayerIndex = 0
        currentCard = nil
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    func selectRandomActivity() {
        guard let activity = interactor.getRandomActivity() else {
            currentActivity = nil
            return
        }
        guard let question = interactor.getRandomQuestion(for: activity) else {
            currentQuestion = nil
            return
        }
        currentActivity = activity
        currentQuestion = question
    }
    
    func drawCard() {
        guard let card = interactor.drawCard(for: currentPlayer) else {
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
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        interactor.saveCard(card: card, for: &players[playerIndex])
        currentCardAction = .saved
        currentCard = nil
    }
    
    func playSavedCard(_ card: Card) {
        guard let playerIndex = players.firstIndex(where: { $0.id == currentPlayer.id }) else { return }
        interactor.playSavedCard(card: card, for: &players[playerIndex])
    }
    
    func nextPlayer() {
        currentPlayerIndex = interactor.nextPlayer(currentIndex: currentPlayerIndex, playerCount: players.count)
        currentCard = nil
    }
    
    func resetActivities() {
        interactor.resetActivities()
    }
    
    func isPlayerVoted(_ playerID: UUID) -> Bool {
        return votes.values.flatMap { $0 }.contains(playerID)
    }
    
    func registerVote(playerID: String, choice: String) {
        if let uuid = UUID(uuidString: playerID), !isPlayerVoted(uuid){
            votes[choice, default: []].append(uuid)
            if isVotingComplete() {
                endVoting()
            }
        }
    }
    
    func isVotingComplete() -> Bool {
        let totalVotes = votes.values.reduce(0) { $0 + $1.count }
        return totalVotes == players.count
    }
    
    func endVoting() {
        // Handle round end logic (e.g., show results)
        nextPlayer() //temporary
        print("Voting Complete: \(votes)")
    }
    
    func getPlayerName(from id: UUID) -> String {
        players.first(where: { $0.id == id })?.name ?? "?"
    }
}
