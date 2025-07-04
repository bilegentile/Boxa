//
//  ContentView.swift
//  Boxa
//
//  Created by Beniamino Gentile on 03/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = CellViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach($viewModel.cells) { cell in
                        CellView(cell: cell)
                            .padding()
                    }
                }
                .padding()
            }
            .navigationTitle("Boxas")
        }
        .onAppear {
            //This function generates random cells for testing purposes
            viewModel.createSampleData()
        }
    }
}

#Preview {
    ContentView()
}
