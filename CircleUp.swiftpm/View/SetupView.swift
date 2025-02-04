//
//  SetupView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 21/01/25.
//

import SwiftUI

struct SetupView: View {
    @State private var playerCount = 2
    @State private var playerNames: [String] = []
    @Binding var isSettingUpPlayers: Bool
    @ObservedObject var presenter: GamePresenter

    init(presenter: GamePresenter, isSettingUpPlayers: Binding<Bool>) {
        _presenter = ObservedObject(wrappedValue: presenter)
        _isSettingUpPlayers = isSettingUpPlayers
    }

    var body: some View {
        VStack {
            if playerNames.isEmpty {
                VStack {
                    Text("Enter number of players:")
                    Stepper("Number of players: \(playerCount)", value: $playerCount, in: 2...8)
                        .padding()
                    Button("Next") {
                        playerNames = (1...playerCount).map { "Player \($0)" }
                    }
                }
            } else {
                VStack {
                    Text("Enter names for \(playerCount) players:")
                    ForEach(0..<playerCount, id: \.self) { index in
                        TextField("Player \(index + 1) Name", text: $playerNames[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    Button("Start Game") {
                        presenter.setupPlayers(names: playerNames)
                        isSettingUpPlayers = false
                    }
                }
            }
        }
        .padding()
    }
}
