//
//  Color+Ext.swift
//  Boxa
//
//  Created by Beniamino Gentile on 04/07/25.
//

import SwiftUI

extension Color {
    static var random: Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown]
        return colors.randomElement() ?? .accentColor
    }
}
