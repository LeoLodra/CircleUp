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
        VStack {
            if !player.hand.isEmpty {
                HStack {
                    ForEach(player.hand, id: \.id) { card in
                        VStack {
                            Text(card.title)
                                .font(.subheadline)
                                .padding(4)
                                .background(Color.orange.opacity(0.7))
                                .cornerRadius(6)
                                .foregroundColor(.white)
                            
                            Button("Play") {
                                cardPresenter.playSavedCard(card)
                            }
                            .buttonStyle(GameButtonStyle(color: .green))
                        }
                    }
                }
            }
            
            Text(player.name)
                .font(.headline)
                .padding(8)
                .background(Capsule().fill(Color.blue.opacity(0.8)))
                .foregroundColor(.white)
            //MARK: Temporary UI
            if gamePresenter.selectPlayerFor != nil && gamePresenter.currentPlayer.id != player.id {
                Button("Select") {
                    if gamePresenter.selectPlayerFor == .teamUp {
                        gamePresenter.teamUp(with: player)
                    } else if gamePresenter.selectPlayerFor == .stealWild {
                        gamePresenter.stealWildCard(from: player)
                    }
                }
                .buttonStyle(GameButtonStyle(color: .yellow))
            }
            if gamePresenter.currentActivity == .mostLikely || gamePresenter.currentActivity == .wouldYouRather || gamePresenter.currentActivity == .whichOne || gamePresenter.currentActivity == .whatWouldYouDo {
                if !gamePresenter.isRolling {
                    VoteTokenView(player: player, presenter: gamePresenter)
                }
            }
        }
        .frame(width: 300, height: 300)
    }
}
