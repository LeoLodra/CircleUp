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
                        .font(.custom("Chalkboard SE", size: 24))
                        .foregroundColor(.lightText)
                        .padding()
                    
                    if let activity = gamePresenter.currentActivity {
                        Text("\(activity.rawValue)")
                            .font(.custom("Chalkboard SE", size: 30))
                            .bold()
                            .foregroundColor(.neonPink)
                        
                        if let question = gamePresenter.currentQuestion {
                            VStack {
                                Text(question.title)
                                    .font(.custom("Chalkboard SE", size: 26))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.fadedText)
                                if !gamePresenter.isRolling {
                                    if let options = question.options {
                                        HStack {
                                            if let insights = question.insights {
                                                ForEach(Array(zip(options, insights)), id: \.0) { (option, insight) in
                                                    VoteDropAreaView(choice: option, insight: insight, presenter: gamePresenter)
                                                }
                                            } else {
                                                ForEach(options, id: \.self) { option in
                                                    VoteDropAreaView(choice: option, insight: nil, presenter: gamePresenter)
                                                }
                                            }
                                        }
                                    }
                                    
                                    if gamePresenter.turnDone || question.options == nil {
                                        Button("End Turn") {
                                            gamePresenter.endTurn()
                                        }
                                        .buttonStyle(GameButtonStyle(color: Color.buttonRed))
                                    }
                                }
                            }
                        }
                    } else {
                        Text("Tap the button to start an activity!")
                            .font(.custom("Chalkboard SE", size: 30))
                            .foregroundColor(.neonPink)
                            .padding()
                    }
                    
                    HStack {
                        if gamePresenter.currentActivity == nil {
                            RollView(gamePresenter: gamePresenter)
                                .buttonStyle(GameButtonStyle(color: .buttonGreen))
                            Button("Wild Cards") {
                                cardPresenter.drawCard()
                            }
                            .buttonStyle(GameButtonStyle(color: .buttonOrange))
                            .disabled(gamePresenter.currentPlayer.hand.count >= 2)
                        }
                    }
                }
                .frame(width: geometry.size.height * 0.7, alignment: .center)
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
