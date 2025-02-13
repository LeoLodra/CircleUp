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
                    (
                    Text("Current Player: ")
                        .foregroundColor(.lightText)
                    +
                    Text("\(gamePresenter.currentPlayer.name)")
                        .foregroundColor(gamePresenter.currentPlayer.color)
                    )
                    .font(.custom("Chalkboard SE", size: 22))
                    .padding(2)
                    
                    if let activity = gamePresenter.currentActivity {
                        Text("\(activity.rawValue)")
                            .font(.custom("Chalkboard SE", size: 28))
                            .bold()
                            .foregroundColor(.neonPink)
                        
                        if let question = gamePresenter.currentQuestion {
                            VStack {
                                Text(question.title)
                                    .font(.custom("Chalkboard SE", size: 24))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.fadedText)
                                if !gamePresenter.isRolling {
                                    if let options = question.options {
                                        VStack {
                                            if let insights = question.insights {
                                                VStack {
                                                    HStack {
                                                        VoteDropAreaView(choice: options[0], insight: insights[0], presenter: gamePresenter)
                                                        VoteDropAreaView(choice: options[1], insight: insights[1], presenter: gamePresenter)
                                                    }
                                                    HStack {
                                                        VoteDropAreaView(choice: options[2], insight: insights[2], presenter: gamePresenter)
                                                        VoteDropAreaView(choice: options[3], insight: insights[3], presenter: gamePresenter)
                                                    }
                                                }
                                            } else {
                                                if options.count > 4 {
                                                    HStack {
                                                        ForEach(0..<4, id: \.self) { index in
                                                            VoteDropAreaView(choice: options[index], insight: nil, presenter: gamePresenter)
                                                        }
                                                    }
                                                    HStack {
                                                        ForEach(4..<options.count, id: \.self) { index in
                                                            VoteDropAreaView(choice: options[index], insight: nil, presenter: gamePresenter)
                                                        }
                                                    }
                                                } else {
                                                    HStack {
                                                        ForEach(options, id: \.self) { option in
                                                            VoteDropAreaView(choice: option, insight: nil, presenter: gamePresenter)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                    if gamePresenter.turnDone || question.options == nil {
                                        Button("End Turn") {
                                            gamePresenter.endTurn()
                                        }
                                        .buttonStyle(GameButtonStyle(color: Color.buttonRed, width: 120, height: 50))
                                    }
                                }
                            }
                        }
                    } else {
                        Text("Tap the button to start an activity!")
                            .font(.custom("Chalkboard SE", size: 30))
                            .foregroundColor(.neonPink)
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
