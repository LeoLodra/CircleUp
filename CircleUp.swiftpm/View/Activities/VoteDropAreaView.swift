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
                    .font(.custom("Chalkboard SE", size: 20))
                    .padding()
                    .background(Color.optionBackground)
                    .foregroundColor(.lightText)
                    .multilineTextAlignment(.center)
                    .cornerRadius(12)
                    .frame(width: 150, height: 100)
            } else {
                Text(choice)
                    .font(.custom("Chalkboard SE", size: 20))
                    .padding()
                    .background(Color.optionBackground)
                    .foregroundColor(.lightText)
                    .multilineTextAlignment(.center)
                    .cornerRadius(12)
                    .frame(maxWidth: 200, maxHeight: 100) // ✅ Limits width but lets height expand
            }
            // Show votes in this area
            HStack {
                ForEach(presenter.votes[choice] ?? [], id: \.self) { playerID in
                    Text(getInitials(from: presenter.getPlayerName(from: playerID)))
                        .font(.body)
                        .padding(5)
                        .background(Color.buttonBlue)
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
