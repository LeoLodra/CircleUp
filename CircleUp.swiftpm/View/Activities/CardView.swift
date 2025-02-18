//
//  CardView.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 18/02/25.
//


import SwiftUI

struct CardView: View {
    let card: Card?
    let isEnabled: Bool
    let playerColor: Color
    let cardPresenter: CardPresenter
    
    private var isPlayable: Bool {
        guard let card = card, isEnabled else { return false }
        
        switch card.effect {
        case .swapActivity:
            return cardPresenter.ableToSwap()
        case .teamUp:
            return cardPresenter.ableToTeamUp()
        default:
            return true
        }
    }
    
    var body: some View {
        VStack {
            Text(card?.title ?? "Empty")
                .font(.custom("Chalkboard SE", size: 18))
                .padding(6)
                .frame(width: 80, height: 40)
                .background(card != nil ? (isPlayable ? playerColor.opacity(0.7) : Color.gray.opacity(0.5)) : Color.gray.opacity(0.2))
                .cornerRadius(8)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(card != nil ? (isPlayable ? playerColor : Color.gray) : Color.gray.opacity(0.5), lineWidth: 2)
                )
            
            Button(action: {
                if isEnabled, let card = card {
                    cardPresenter.playSavedCard(card)
                }
            }) {
                HStack {
                    if card == nil {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.white)
                    } else if !isPlayable {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.white)
                    }
                    Text(card == nil ? "" : "Play")
                        .font(.custom("Chalkboard SE", size: 18))
                        .bold()
                }
                .frame(width: 80, height: 30)
                .background(card != nil ? (isPlayable ? Color.green : Color.gray) : Color.gray.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(card != nil ? (isPlayable ? Color.green : Color.gray) : Color.gray.opacity(0.5), lineWidth: 2)
                )
            }
            .disabled(card == nil || !isPlayable)
        }
    }
}
