//
//  Player.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 20/01/25.
//

import Foundation
import SwiftUICore

struct Player: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var hand: [Card] = []
    var color: Color
}
