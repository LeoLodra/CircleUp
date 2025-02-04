////
////  CardInteractor.swift
////  CircleUp
////
////  Created by Leonardo Marhan on 04/02/25.
////
//
//final class CardInteractor: CardInteractorProtocol {
//    private var wildCards: [Card] = []
//    
//    init() {
//        generateWildCards()
//    }
//    
//    private func addCards(_ card: Card, count: Int) -> [Card] {
//        return Array(repeating: card, count: count)
//    }
//    
//    private func generateWildCards() {
//        wildCards = [
//            addCards(Card(title: "Boost", description: "Gain 5 points."), count: 3)
//        ].flatMap { $0 }.shuffled()
//    }
//    
//    func drawCard(for player: Player) -> Card? {
//        guard !wildCards.isEmpty else { return nil }
//        return wildCards.removeFirst()
//    }
//    
//    //    func applyCardEffect(card: Card, to player: inout Player) {
//    //        player.points += card.points
//    //        if let effect = card.skillEffect {
//    //            player.skills[effect.skillType, default: 0] += effect.value
//    //        }
//    //    }
//
//    func saveCard(card: Card, for player: inout Player) {
//        player.hand.append(card)
//    }
//    
//    func playSavedCard(card: Card, for player: inout Player) {
//        guard let cardIndex = player.hand.firstIndex(where: { $0.id == card.id }) else { return }
//        //        applyCardEffect(card: card, to: &player)
//        player.hand.remove(at: cardIndex)
//    }
//}
//
