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
    
    var width: CGFloat {
        if let activity = presenter.currentActivity {
            if activity == .mostLikely {
                return 120
            }
        }
        return 200
    }
    
    var height: CGFloat {
        if let activity = presenter.currentActivity {
            if activity == .mostLikely {
                return 80
            }
        }
        return 100
    }
    
    var body: some View {
        ZStack {
            if let insight = insight, presenter.turnDone {
                Text(insight)
                    .font(.custom("Chalkboard SE", size: 20))
                    .padding()
                    .frame(width: width, height: height)
                    .background(Color.optionBackground)
                    .foregroundColor(.lightText)
                    .multilineTextAlignment(.center)
                    .cornerRadius(12)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.7)
            } else {
                Text(choice)
                    .font(.custom("Chalkboard SE", size: 20))
                    .padding()
                    .frame(width: width, height: height)
                    .background(Color.optionBackground)
                    .foregroundColor(.lightText)
                    .multilineTextAlignment(.center)
                    .cornerRadius(12)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.7)
            }
            
            VStack {
                HStack{
                    HStack {
                        ForEach(presenter.votes[choice] ?? [], id: \.self) { playerID in
                            let player = presenter.getPlayer(from: playerID)
                            Text(getInitials(from: player.name))
                                .font(.custom("SF Pro", size: 12))
                                .padding(2)
                                .background(player.color)
                                .cornerRadius(12)
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
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
