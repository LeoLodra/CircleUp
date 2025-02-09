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
            .background(presenter.isPlayerVoted(player.id) ? Color.gray.opacity(0.5) : Color.blue.opacity(0.8))
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
            .draggable(player.id.uuidString)
            .disabled(presenter.isPlayerVoted(player.id))
    }
}

func getInitials(from fullName: String) -> String {
    let nameComponents = fullName.split(separator: " ")
    let initials = nameComponents.prefix(2).map { $0.prefix(1) }
    return initials.joined().uppercased()
}
