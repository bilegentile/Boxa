//
//  CellDetailView.swift
//  Boxa
//
//  Created by Beniamino Gentile on 04/07/25.
//

import SwiftUI

struct CellDetailView: View {
    @Binding var cell: Cell
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            cell.color
                .opacity(colorScheme == .dark ? 0.6 : 0.2)
            VStack {
                Text(cell.title)
                    .font(.title)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    withAnimation {
                        cell.isFavorite.toggle()
                    }
                } label: {
                    Image(systemName: cell.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .accessibilityLabel(cell.isFavorite ? "Remove from favorites" : "Add to favorites")
                }
            }
        }
        .navigationTitle(cell.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var cell = Cell.example
    CellDetailView(cell: $cell)
}
