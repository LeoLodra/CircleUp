import SwiftUI

struct RollView: View {
    @ObservedObject var gamePresenter: GamePresenter
    @State private var isRolling = false

    var body: some View {
        VStack {
            Button("Roll Activity") {
                startRollingAnimation()
            }
            .buttonStyle(GameButtonStyle(color: .green))
            .disabled(isRolling)
        }
    }

    private func startRollingAnimation() {
        guard !isRolling else { return }
        isRolling = true

        Task { [weak gamePresenter] in
            guard let gamePresenter = gamePresenter else { return }
            await gamePresenter.rollRandomActivity()
            DispatchQueue.main.async {
                isRolling = false
            }
        }
    }
}
