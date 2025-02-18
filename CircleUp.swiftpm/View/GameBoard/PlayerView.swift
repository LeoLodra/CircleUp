//
//  PlayerView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 03/02/25.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var gamePresenter: GamePresenter
    @ObservedObject var cardPresenter: CardPresenter
    let player: Player
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 120)
                .foregroundColor(.backgroundSecondary)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(gamePresenter.currentPlayer == player || gamePresenter.teammate == player ? player.color : Color.clear, lineWidth: 4) // Add a glowing border
                )
                .shadow(color: gamePresenter.currentPlayer == player || gamePresenter.teammate == player ? player.color : Color.clear, radius: 10) // Add a soft glow
            HStack {
                if player.hand.count > 0 {
                    VStack {
                        Text(player.hand[0].title)
                            .font(.subheadline)
                            .padding(4)
                            .background(Color.orange.opacity(0.7))
                            .cornerRadius(6)
                            .foregroundColor(.white)
                        
                        Button("Play") {
                            cardPresenter.playSavedCard(player.hand[0])
                        }
                        .buttonStyle(GameButtonStyle(color: .green))
                    }
                }
                
                VStack {
                    Text("\(player.name)")
                        .font(.custom("Chalkboard SE", size: 20))
                        .foregroundColor(.lightText)
                    
                    VoteTokenView(player: player, presenter: gamePresenter)
                }
                
                if player.hand.count > 1 {
                    VStack {
                        Text(player.hand[1].title)
                            .font(.subheadline)
                            .padding(4)
                            .background(Color.orange.opacity(0.7))
                            .cornerRadius(6)
                            .foregroundColor(.white)
                        
                        Button("Play") {
                            cardPresenter.playSavedCard(player.hand[1])
                        }
                        .buttonStyle(GameButtonStyle(color: .green))
                    }
                }
            }
        }
        VStack {
            if gamePresenter.selectPlayerFor != nil && gamePresenter.currentPlayer.id != player.id {
                Button("Select") {
                    if gamePresenter.selectPlayerFor == .teamUp {
                        gamePresenter.teamUp(with: player)
                    } else if gamePresenter.selectPlayerFor == .stealWild {
                        gamePresenter.stealWildCard(from: player)
                    }
                }
                .buttonStyle(GameButtonStyle(color: .buttonOrange))
            }
        }
        .frame(width: 300, height: 300)
    }
}
