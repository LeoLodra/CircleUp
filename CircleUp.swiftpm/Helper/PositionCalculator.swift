//
//  PositionCalculator.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 22/01/25.
//


import SwiftUI

struct PositionCalculator {
    static func rectanglePosition(for index: Int, total: Int, size: CGSize) -> (point: CGPoint, rotation: Angle) {
        var predefinedPositions: [(CGPoint, Angle)] = []
        let centerX = size.width / 2
        let centerY = size.height / 2
        let leftX = size.width * 0.33
        let topY = size.height * 0.33
        let rightX = size.width * 0.66
        let bottomY = size.height * 0.66
        let edgePadding: CGFloat = 50
        
        switch total {
        case 1...4:
            predefinedPositions = [
                (CGPoint(x: centerX, y: size.height - edgePadding), .degrees(0)), // Bottom
                (CGPoint(x: edgePadding, y: centerY), .degrees(90)), // Left
                (CGPoint(x: centerX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: size.width - edgePadding, y: centerY), .degrees(-90)) // Right
            ]
        case 5:
            predefinedPositions = [
                (CGPoint(x: centerX, y: size.height - edgePadding), .degrees(0)), // Bottom
                (CGPoint(x: edgePadding, y: bottomY), .degrees(90)), // Left Bottom
                (CGPoint(x: edgePadding, y: topY), .degrees(90)), // Left Top
                (CGPoint(x: centerX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: size.width - edgePadding, y: centerY), .degrees(-90)), // Right
            ]
        case 6:
            predefinedPositions = [
                (CGPoint(x: centerX, y: size.height - edgePadding), .degrees(0)), // Bottom
                (CGPoint(x: edgePadding, y: bottomY), .degrees(90)), // Left Bottom
                (CGPoint(x: edgePadding, y: topY), .degrees(90)), // Left Top
                (CGPoint(x: centerX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: size.width - edgePadding, y: topY), .degrees(-90)), // Right Top
                (CGPoint(x: size.width - edgePadding, y: bottomY), .degrees(-90)), // Right Bottom
            ]
        case 7:
            predefinedPositions = [
                (CGPoint(x: rightX, y: size.height - edgePadding), .degrees(0)), // Bottom Left
                (CGPoint(x: leftX, y: size.height - edgePadding), .degrees(0)), // Bottom Right
                (CGPoint(x: edgePadding, y: bottomY), .degrees(90)), // Left Bottom
                (CGPoint(x: edgePadding, y: topY), .degrees(90)), // Left Top
                (CGPoint(x: centerX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: size.width - edgePadding, y: topY), .degrees(-90)), // Right Top
                (CGPoint(x: size.width - edgePadding, y: bottomY), .degrees(-90)), // Right Bottom
            ]
        default:
            predefinedPositions = [
                (CGPoint(x: rightX, y: size.height - edgePadding), .degrees(0)), // Bottom Left
                (CGPoint(x: leftX, y: size.height - edgePadding), .degrees(0)), // Bottom Right
                (CGPoint(x: edgePadding, y: bottomY), .degrees(90)), // Left Bottom
                (CGPoint(x: edgePadding, y: topY), .degrees(90)), // Left Top
                (CGPoint(x: leftX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: rightX, y: edgePadding), .degrees(180)), // Top
                (CGPoint(x: size.width - edgePadding, y: topY), .degrees(-90)), // Right Top
                (CGPoint(x: size.width - edgePadding, y: bottomY), .degrees(-90)), // Right Bottom
            ]
        }
        
        return predefinedPositions[index]
    }
    
    static func rotationForCurrentPlayer(index: Int, total: Int) -> Angle {
        let directions: [Angle] = {
            switch total {
            case 1...4:
                return [.degrees(0), .degrees(90), .degrees(180), .degrees(-90)]
            case 5:
                return [.degrees(0), .degrees(90), .degrees(90), .degrees(180), .degrees(-90)]
            case 6:
                return [.degrees(0), .degrees(90), .degrees(90), .degrees(180), .degrees(-90), .degrees(-90)]
            case 7:
                return [.degrees(0), .degrees(0), .degrees(90), .degrees(90), .degrees(180), .degrees(-90), .degrees(-90)]
            default:
                return [.degrees(0), .degrees(0), .degrees(90), .degrees(90), .degrees(180), .degrees(180), .degrees(-90), .degrees(-90)]
            }
        }()
        
        return directions[index]
    }
}
