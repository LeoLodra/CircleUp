//
//  GameBoardView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 21/01/25.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var gamePresenter: GamePresenter
    @ObservedObject var cardPresenter: CardPresenter
    let onExit: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Current Player: \(gamePresenter.currentPlayer.name)")
                        .font(.headline)
                    
                    if let activity = gamePresenter.currentActivity {
                        Text("Activity: \(activity.rawValue)")
                            .font(.title2)
                            .padding()
                        
                        if let question = gamePresenter.currentQuestion {
                            Text(question.title)
                                .font(.body)
                                .padding()
                            HStack {
                                if !gamePresenter.isRolling {
                                    if let options = question.options {
                                        ForEach(options, id: \.self) { option in
                                            VoteDropAreaView(choice: option, presenter: gamePresenter)
                                        }
                                    } else {
                                        Button("End Turn") {
                                            gamePresenter.didEndVoting()
                                        }
                                        .buttonStyle(GameButtonStyle(color: .red))
                                    }
                                }
                                
                            }
                            .padding()
                        }
                    } else {
                        Text("Tap the button to start an activity!")
                            .font(.body)
                            .padding()
                    }
                    
                    HStack {
                        if gamePresenter.currentActivity == nil {
                            RollView(gamePresenter: gamePresenter)
                                .buttonStyle(GameButtonStyle(color: .green))
                            Button("Wild Cards") {
                                cardPresenter.drawCard()
                            }
                            .buttonStyle(GameButtonStyle(color: .yellow))
                            .disabled(gamePresenter.currentPlayer.hand.count >= 2)
                        }
                    }
                }
                .rotationEffect(
                    PositionCalculator.rotationForCurrentPlayer(
                        index: gamePresenter.currentPlayerIndex,
                        total: gamePresenter.players.count
                    )
                )
                
                ForEach(gamePresenter.players.indices, id: \.self) { index in
                    let position = PositionCalculator.rectanglePosition(
                        for: index,
                        total: gamePresenter.players.count,
                        size: geometry.size
                    )
                    
                    PlayerView(gamePresenter: gamePresenter, cardPresenter: cardPresenter, player: gamePresenter.players[index])
                        .rotationEffect(position.rotation)
                        .position(position.point)
                }
            }
        }
        .padding()
    }
}

struct GameButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(8)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
