//
//  VoteDropAreaView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

import SwiftUI

struct VoteDropAreaView: View {
    let choice: String
    let insight: String?
    @ObservedObject var presenter: GamePresenter
    
    var body: some View {
        VStack {
            if let insight = insight, presenter.turnDone {
                Text(insight)
                    .font(.title)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                    .frame(width: 150, height: 100)
            } else {
                Text(choice)
                    .font(.title)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                    .frame(width: 150, height: 100)
            }
            // Show votes in this area
            HStack {
                ForEach(presenter.votes[choice] ?? [], id: \.self) { playerID in
                    Text(getInitials(from: presenter.getPlayerName(from: playerID)))
                        .font(.body)
                        .padding(5)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 150, height: 100)
        .onDrop(of: [.text], isTargeted: nil) { providers in
            _ = providers.first?.loadObject(ofClass: String.self) { playerID, _ in
                if let playerID = playerID {
                    DispatchQueue.main.async {
                        presenter.registerVote(playerID: playerID, choice: choice)
                    }
                }
            }
            return true
        }
    }
}
