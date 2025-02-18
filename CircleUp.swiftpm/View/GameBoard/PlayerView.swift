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
                        .stroke(gamePresenter.currentPlayer == player || gamePresenter.teammate == player ? player.color : Color.clear, lineWidth: 4)
                )
                .shadow(color: gamePresenter.currentPlayer == player || gamePresenter.teammate == player ? player.color : Color.clear, radius: 10)
            HStack {
                CardView(
                    card: player.hand.indices.contains(0) ? player.hand[0] : nil,
                    isEnabled: gamePresenter.currentPlayer == player && !gamePresenter.isRolling,
                    playerColor: player.color,
                    cardPresenter: cardPresenter
                )
                
                
                VStack {
                    Text("\(player.name)")
                        .font(.custom("Chalkboard SE", size: 20))
                        .foregroundColor(.lightText)
                    
                    VoteTokenView(player: player, presenter: gamePresenter)
                }
                
                CardView(
                    card: player.hand.indices.contains(1) ? player.hand[1] : nil,
                    isEnabled: gamePresenter.currentPlayer == player && !gamePresenter.isRolling,
                    playerColor: player.color,
                    cardPresenter: cardPresenter
                )
                
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
                .buttonStyle(GameButtonStyle(color: player.color))
            }
        }
        .frame(width: 300, height: 300)
    }
}

