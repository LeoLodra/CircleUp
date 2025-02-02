//
//  InteractorProtocol.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

protocol GameInteractorProtocol {
    func drawCard(for player: Player) -> Card?
    func getRandomActivity() -> Activity?
    func resetActivities()
//    func applyCardEffect(card: Card, to player: inout Player)
    func saveCard(card: Card, for player: inout Player)
    func playSavedCard(card: Card, for player: inout Player)
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int
}

protocol QuestionInteractorProtocol {
    func fetchQuestion() -> Question?
    func processAnswer(for question: Question, choice: String)
}
