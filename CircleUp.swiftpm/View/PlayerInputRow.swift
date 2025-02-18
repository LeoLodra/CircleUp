//
//  PlayerInputRow.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 13/02/25.
//

import SwiftUI

struct PlayerInputRow: View {
    @Binding var name: String
    @Binding var selectedColor: Color
    let availableColors: [Color]

    var body: some View {
        VStack {
            TextField("Player Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.custom("Chalkboard SE", size: 24))
                .frame(width: 300)
                .padding(5)

            // Color Picker
            HStack {
                ForEach(availableColors, id: \.self) { color in
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(color)
                        .overlay(
                            Circle().stroke(selectedColor == color ? Color.white : Color.clear, lineWidth: 3)
                        )
                        .onTapGesture {
                            selectedColor = color
                        }
                }
            }
        }
        .padding()
    }
}
