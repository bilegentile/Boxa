//
//  ContentView.swift
//  Boxa
//
//  Created by Beniamino Gentile on 03/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach($viewModel.cells) { cell in
                        NavigationLink {
                            CellDetailView(cell: cell)
                        } label: {
                            CellView(cell: cell)
                                .padding()
                        }
                        .buttonStyle(.plain)
                    }
                }
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
