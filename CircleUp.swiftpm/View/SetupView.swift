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
    @State private var playerColors: [Color] = []
    @ObservedObject var presenter: GamePresenter
    
    let onSetupComplete: () -> Void
    
    let availableColors: [Color] = [.neonPink, .deepCyan, .neonGold, .neonPurple, .neonOrange, .neonRed, .neonGreen, .electricIndigo]
    
    init(presenter: GamePresenter, onSetupComplete: @escaping () -> Void) {
        _presenter = ObservedObject(wrappedValue: presenter)
        self.onSetupComplete = onSetupComplete
    }
    
    var body: some View {
        VStack {
            if playerNames.isEmpty {
                VStack {
                    Text("Enter number of players:")
                        .font(.custom("Chalkboard SE", size: 32))
                        .foregroundColor(.lightText)
                    HStack {
                        Button(action: { if playerCount > 2 { playerCount -= 1 } }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(playerCount == 2 ? .buttonDisabled : .buttonRed)
                                .font(.custom("Chalkboard SE", size: 40))
                        }
                        
                        Text("Players: \(playerCount)")
                            .font(.custom("Chalkboard SE", size: 24))
                            .foregroundColor(.lightText)
                            .padding(.horizontal, 16)
                        
                        Button(action: { if playerCount < 8 { playerCount += 1 } }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(playerCount == 8 ? .buttonDisabled : .buttonGreen)
                                .font(.custom("Chalkboard SE", size: 36))
                        }
                    }
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    Button("Next") {
                        playerNames = (1...playerCount).map { "Player \($0)" }
                        playerColors = Array(repeating: .neonPink, count: playerCount)
                    }
                    .buttonStyle(GameButtonStyle(color: Color.buttonBlue, width: 200))
                    .padding()
                }
            } else {
                GeometryReader { geometry in
                    VStack {
                        Text("Enter names for \(playerCount) players:")
                            .font(.custom("Chalkboard SE", size: 32))
                            .foregroundColor(.lightText)
                        
                        if playerCount <= 4 {
                            VStack {
                                ForEach(playerNames.indices, id: \.self) { index in
                                    PlayerInputRow(
                                        name: $playerNames[index],
                                        selectedColor: $playerColors[index],
                                        availableColors: availableColors
                                    )
                                }
                            }
                        } else {
                            let middleCount = (playerCount + 1) / 2
                            
                            HStack(spacing: 80) {
                                VStack {
                                    ForEach(0..<middleCount, id: \.self) { index in
                                        PlayerInputRow(
                                            name: $playerNames[index],
                                            selectedColor: $playerColors[index],
                                            availableColors: availableColors
                                        )
                                    }
                                }
                                
                                VStack {
                                    ForEach(middleCount..<playerCount, id: \.self) { index in
                                        PlayerInputRow(
                                            name: $playerNames[index],
                                            selectedColor: $playerColors[index],
                                            availableColors: availableColors
                                        )
                                    }
                                }
                            }
                        }

                        
                        Button("Start Game") {
                            presenter.setupPlayers(names: playerNames, colors: playerColors)
                            onSetupComplete()
                        }
                        .buttonStyle(GameButtonStyle(color: Color.buttonBlue, width: 200))
                        .padding(20)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
        }
        .padding()
    }
}
