import SwiftUI

struct GameView: View {
    @StateObject private var gamePresenter: GamePresenter
    @StateObject private var cardPresenter: CardPresenter
    @StateObject private var router: GameRouter

    init(gamePresenter: GamePresenter, cardPresenter: CardPresenter, router: GameRouter) {
        _gamePresenter = StateObject(wrappedValue: gamePresenter)
        _cardPresenter = StateObject(wrappedValue: cardPresenter)
        _router = StateObject(wrappedValue: router)
    }

    var body: some View {
        switch router.currentView {
        case .setup:
            SetupView(presenter: gamePresenter) {
                router.navigateToGameBoard()
            }

        case .gameBoard:
            GameBoardView(gamePresenter: gamePresenter, cardPresenter: cardPresenter) {
                router.navigateToSetup()
            }
        }
    }
}

