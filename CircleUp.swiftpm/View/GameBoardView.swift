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
                    
                    if let activity = presenter.currentActivity {
                        Text("Activity: \(activity.type)")
                            .font(.title2)
                            .padding()
                        Text(activity.prompt)
                            .font(.body)
                            .padding()
                    } else {
                        Text("Tap the button to start an activity!")
                            .font(.body)
                            .padding()
                    }
                    
                    HStack {
                        Button("Select Activity") {
                            presenter.selectRandomActivity()
                        }
                        .padding()
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        
                        Button("Wild Cards") {
                            presenter.drawCard()
                        }
                        .padding()
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        
                        Button("Next Player") {
                            presenter.nextPlayer()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(8)
                        .foregroundColor(.white)
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
                    PlayerView(presenter: presenter, player: presenter.players[index])
                        .rotationEffect(position.rotation)
                        .position(position.point)
                }
            }
        }
        .padding()
    }
}

struct PlayerView: View {
    @ObservedObject var presenter: GamePresenter
    let player: Player
    
    var body: some View {
        VStack {
            Text(player.name)
                .font(.headline)
                .padding(8)
                .background(Capsule().fill(Color.blue.opacity(0.8)))
                .foregroundColor(.white)
            if !player.hand.isEmpty {
                VStack {
                    HStack {
                        ForEach(player.hand) { card in
                            VStack {
                                Text(card.title)
                                    .font(.subheadline)
                                    .padding(4)
                                    .background(Color.orange.opacity(0.7))
                                    .cornerRadius(6)
                                    .foregroundColor(.white)
                                
                                Button("Play") {
                                    presenter.playSavedCard(card)
                                }
                                .font(.footnote)
                                .padding(4)
                                .background(Color.green)
                                .cornerRadius(4)
                                .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .frame(width: 300, height: 300)
    }
}
