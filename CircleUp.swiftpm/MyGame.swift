import SwiftUI

@main
struct MyGame: App {
    var body: some Scene {
        WindowGroup {
            let interactor = GameInteractor()
            let presenter = GamePresenter(interactor: interactor)
            GameView(presenter: presenter)
        }
    }
}
