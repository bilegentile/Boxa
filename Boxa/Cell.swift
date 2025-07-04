//
//  Cell.swift
//  Boxa
//
//  Created by Beniamino Gentile on 03/07/25.
//

import SwiftUI

struct Cell: Identifiable {
    let id = UUID()
    var title: String
    var isFavorite = false
    var color = Color.random
    
    static let example = Cell(title: "Example")
}
