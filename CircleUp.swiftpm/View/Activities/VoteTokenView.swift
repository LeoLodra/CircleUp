//
//  VoteTokenView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 04/02/25.
//

import SwiftUI

struct VoteTokenView: View {
    let player: Player
    @ObservedObject var presenter: GamePresenter
    
    var body: some View {
        Text(getInitials(from: player.name))
            .font(.title)
            .frame(width: 50, height: 50)
            .background(disableToken(presenter: presenter, player: player) ? Color.buttonDisabled : player.color)
            .cornerRadius(25)
            .foregroundColor(.lightText) // Set text color dynamically
            .draggable(player.id.uuidString)
            .disabled(disableToken(presenter: presenter, player: player))
            .overlay(
                Circle()
                    .stroke(player.color, lineWidth: 2)
                    .opacity(presenter.currentPlayer == player ? 1 : 0)
            )
    }
}

func getInitials(from fullName: String) -> String {
    let nameComponents = fullName.split(separator: " ")
    let initials = nameComponents.prefix(2).map { $0.prefix(1) }
    return initials.joined().uppercased()
}

func disableToken(presenter: GamePresenter, player: Player) -> Bool {
    if [.mostLikely, .wouldYouRather, .whichOne, .whatWouldYouDo].contains(presenter.currentActivity) {
        if !presenter.isRolling && !presenter.isPlayerVoted(player.id) {
            return false
        }
        if presenter.isPlayerVoted(player.id) {
            return true
        }
    } else {
        if presenter.feedback == true && presenter.currentPlayer == player && !presenter.isRolling && !presenter.isPlayerVoted(player.id) {
            return false
        }
    }
    
    return true
}
