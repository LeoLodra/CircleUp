//
//  InteractorProtocol.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//

protocol GameInteractorProtocol {
    func getRandomActivity() -> ActivityType?
    func getRandomQuestion(for type: ActivityType) -> Question?
    func resetActivities()
    func nextPlayer(currentIndex: Int, playerCount: Int) -> Int
    
    func drawCard(for player: Player) -> Card?
    func saveCard(card: Card, for player: inout Player)
    func playSavedCard(card: Card, for player: inout Player)
}

//protocol CardInteractorProtocol {
//    func drawCard(for player: Player) -> Card?
//    func saveCard(card: Card, for player: inout Player)
//    func playSavedCard(card: Card, for player: inout Player)
////    func applyCardEffect(card: Card, to player: inout Player)
//}

protocol QuestionInteractorProtocol {
    func fetchQuestion() -> Question?
    func processAnswer(for question: Question, choice: String)
}
