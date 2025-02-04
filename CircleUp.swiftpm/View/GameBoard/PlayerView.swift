//
//  PlayerView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 03/02/25.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var presenter: GamePresenter
    let player: Player
    
    var body: some View {
        VStack {
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
                .padding(4)
            }
            if let _ = presenter.currentQuestion {
                VoteTokenView(player: player, presenter: presenter)
            }
            Text(player.name)
                .font(.headline)
                .padding(8)
                .background(Capsule().fill(Color.blue.opacity(0.8)))
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 300)
    }
}
