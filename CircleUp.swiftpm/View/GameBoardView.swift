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
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Current Player: \(presenter.currentPlayer.name)")
                        .font(.headline)
                    Text("Points: \(presenter.currentPlayer.points)")
                        .font(.subheadline)
                    if let card = presenter.currentCard {
                        Text("Card: \(card.title)")
                            .font(.title2)
                            .padding()
                        Text(card.description)
                            .font(.body)
                    }
                    Button("Draw Card") {
                        presenter.drawCard()
                    }
                    Button("Next Player") {
                        presenter.nextPlayer()
                    }
                }
                .rotationEffect(
                    PositionCalculator.rotationForCurrentPlayer(
                        index: presenter.currentPlayerIndex,
                        total: presenter.players.count
                    )
                )
                
                
                // Player views
                ForEach(presenter.players.indices, id: \.self) { index in
                    let position = PositionCalculator.rectanglePosition(
                        for: index,
                        total: presenter.players.count,
                        size: geometry.size
                    )
                    PlayerView(player: presenter.players[index])
                        .rotationEffect(position.rotation)
                        .position(position.point)
                }
            }
        }
        .padding()
    }
}

struct PlayerView: View {
    let player: Player
    
    var body: some View {
        VStack {
            Text(player.name)
                .font(.headline)
                .padding(8)
                .background(Capsule().fill(Color.blue.opacity(0.8)))
                .foregroundColor(.white)
        }
        .frame(width: 100, height: 100)
    }
}
