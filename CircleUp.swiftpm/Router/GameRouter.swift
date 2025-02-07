//
//  GameRouter.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 07/02/25.
//

import Foundation

protocol GameRouterProtocol {
    func navigateToGameBoard()
    func navigateToSetup()
}

final class GameRouter: GameRouterProtocol, ObservableObject {
    @Published var currentView: GameRoute = .setup

    func navigateToGameBoard() {
        currentView = .gameBoard
    }

    func navigateToSetup() {
        currentView = .setup
    }
}

enum GameRoute {
    case setup
    case gameBoard
}
