//
//  GameButtonStyle.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 13/02/25.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    var color: Color
    var fontSize: CGFloat? = nil
    var width: CGFloat? = nil
    var height: CGFloat? = nil

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Chalkboard SE", size: fontSize ?? 20))
            .foregroundColor(.lightText)
            .padding()
            .frame(width: width, height: height)
            .background(color)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
