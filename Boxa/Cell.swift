//
//  Cell.swift
//  Boxa
//
//  Created by Beniamino Gentile on 03/07/25.
//

import Foundation

struct Cell: Identifiable {
    let id = UUID()
    var title: String
    var isFavorite = false
    
    static let example = Cell(title: "Example")
}
