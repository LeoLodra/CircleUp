//
//  GameBoardView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 21/01/25.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var presenter: GamePresenter
    
    //    init(presenter: GamePresenter) {
    //        _presenter = ObservedObject(wrappedValue: presenter)
    //    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Current Player: \(presenter.currentPlayer.name)")
                        .font(.headline)
                    
                    if let activity = presenter.currentActivity {
                        Text("Activity: \(activity.rawValue)")
                            .font(.title2)
                            .padding()
                        if let question = presenter.currentQuestion {               Text(question.title)
                                .font(.body)
                                .padding()
                            //                                .transition(.scale)
                            //                                .animation(.easeInOut(duration: 1.5))
                        }
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
                    if let question = presenter.currentQuestion {
                        Text(question.title)
                            .font(.title2)
                            .padding()
                        
                        HStack {
                            if let options = question.options {
                                ForEach(options, id: \.self) { option in
                                    VoteDropAreaView(choice: option, presenter: presenter)
                                }
                            }
                        }
                        .padding()
                        HStack {
                            ForEach(presenter.players) { player in
                                
                            }
                        }
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
