//
//  CellView.swift
//  Boxa
//
//  Created by Beniamino Gentile on 04/07/25.
//

import SwiftUI

struct CellView: View {
    @Binding var cell: Cell
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(cell.color)
                    .opacity(colorScheme == .dark ? 0.6 : 0.2)
                    .shadow(radius: 8)
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                cell.isFavorite.toggle()
                            }
                        } label: {
                            Image(systemName: cell.isFavorite ? "heart.fill" : "heart")
                                .foregroundStyle(.red)
                                .font(.system(size: 30))
                                .accessibilityLabel(cell.isFavorite ? "Remove from favorites" : "Add to favorites")
                        }
                        .padding()
                    }
                    Spacer()
                    Text(cell.title)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(cell.title)
        .accessibilityValue(cell.isFavorite ? "Favorite" : "Not Favorite")
        .accessibilityHint("Double-tap to view details. Magic Tap to toggle favorite.")
        .accessibilityAddTraits(.isButton)
        .accessibilityAction(.magicTap) {
            withAnimation {
                cell.isFavorite.toggle()
            }
        }
    }
}

#Preview {
    @Previewable @State var cell = Cell.example
    CellView(cell: $cell)
}
