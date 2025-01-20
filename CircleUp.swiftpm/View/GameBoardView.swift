//
//  GameBoardView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 21/01/25.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var presenter: GamePresenter

    init(presenter: GamePresenter) {
        _presenter = ObservedObject(wrappedValue: presenter)
    }

    var body: some View {
        VStack {
            Text("Current Player: \(presenter.currentPlayer.name)")
            Text("Points: \(presenter.currentPlayer.points)")
            if let card = presenter.currentCard {
                Text("Card: \(card.title)")
                    .font(.headline)
                Text(card.description)
            }
            Button("Draw Card") {
                presenter.drawCard()
            }
            Button("Next Player") {
                presenter.nextPlayer()
            }
            List(presenter.players) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Text("Points: \(player.points)")
                }
            }
        }
        .padding()
    }
}
