import SwiftUI

struct GameView: View {
    @StateObject private var presenter: GamePresenter
    @State public var isSettingUpPlayers = true

    init(presenter: GamePresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }

    var body: some View {
        if isSettingUpPlayers {
            SetupView(presenter: presenter, isSettingUpPlayers: $isSettingUpPlayers)
        } else {
            GameBoardView(presenter: presenter)
        }
    }
}
