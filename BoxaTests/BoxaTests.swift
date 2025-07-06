//
//  BoxaTests.swift
//  BoxaTests
//
//  Created by Beniamino Gentile on 06/07/25.
//

@testable import Boxa
import Foundation
import Testing

@MainActor
struct BoxaTests {

    @Test func viewModelStartsEmpty() {
        let viewModel = ContentView.ViewModel()
        
        #expect(viewModel.cells.isEmpty, "ViewModel should start with an empty list of cells")
    }
    
    @Test func viewModelCreatesSampleData() {
        let viewModel = ContentView.ViewModel()
        viewModel.createSampleData()
        
        #expect(viewModel.cells.isEmpty == false, "ViewModel should have created some sample data")
    }

}
