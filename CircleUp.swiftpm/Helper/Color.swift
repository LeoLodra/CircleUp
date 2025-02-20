//
//  Color.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 13/02/25.
//

import SwiftUI

extension Color {
    // Backgrounds (Dark Theme)
    static let backgroundPrimary = Color(hex: "#1E1A3D")  // Dark Purple (Primary)
    static let backgroundSecondary = Color(hex: "#15112A")  // Deep Navy (Darker Contrast)
    static let optionBackground = Color(hex: "#3B347A")
    
    // Accents (Neon Glow)
    static let neonPink = Color(hex: "#FF007F")  // Keep as an accent
    static let deepCyan = Color(hex: "#00B2C9")  // Softer cyan
    static let neonPurple = Color(hex: "#A020F0")  // Slightly Softer Purple for Glow
    static let neonOrange = Color(hex: "#FF6700")  // Deep Neon Orange (Good Midway)
    static let neonRed = Color(hex: "#D90429")  // Darker neon red
    static let neonGreen = Color(hex: "#2ECC71")  // Neon Jade (Balanced & readable)
    static let neonGold = Color(hex: "#E5A800")   // Soft Neon Gold
    static let electricIndigo = Color(hex: "#5A0FC8") // Neon blue-purple
    
    // Buttons & Disabled State
    static let buttonBlue = Color(hex: "#5D5FEF")  // Electric Indigo (Better blend with purple)
    static let buttonRed = Color(hex: "#FF3B3F")  // Crimson Red (Softer neon red)
    static let buttonGreen = Color(hex: "#2DE86C")  // Neon Emerald (Easier contrast)
    static let buttonOrange = Color(hex: "#FF9F43")  // Bright Tangerine (Warmer than yellow)
    static let buttonDisabled = Color(hex: "#4A4A5C")  // Muted Grayish Purple (Low Contrast)
    
    // Text & Highlights
    static let lightText = Color(hex: "#F1F1F1")  // Bright White
    static let fadedText = Color(hex: "#B0AEBF")  // Dimmed Grayish Text
}

// Helper to use Hex colors
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
