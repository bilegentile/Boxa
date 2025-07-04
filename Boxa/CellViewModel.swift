//
//  CellViewModel.swift
//  Boxa
//
//  Created by Beniamino Gentile on 04/07/25.
//

import Foundation

@Observable @MainActor
class CellViewModel {
    var cells: [Cell] = []
    
    func createSampleData() {
        for i in 1...20 {
            cells.append(Cell(title: "Cell number \(i)"))
        }
    }
}
