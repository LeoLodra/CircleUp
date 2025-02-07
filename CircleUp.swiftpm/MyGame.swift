import SwiftUI

@main
struct MyGame: App {
    var body: some Scene {
        WindowGroup {
            let gameInteractor = GameInteractor()
            let cardInteractor = CardInteractor()
            let gamePresenter = GamePresenter(interactor: gameInteractor)
            let cardPresenter = CardPresenter(interactor: cardInteractor, gamePresenter: gamePresenter)
            let router = GameRouter()

            GameView(gamePresenter: gamePresenter, cardPresenter: cardPresenter, router: router)
        }
    }
}
