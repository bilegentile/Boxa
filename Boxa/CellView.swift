//
//  CellView.swift
//  Boxa
//
//  Created by Beniamino Gentile on 04/07/25.
//

import SwiftUI

/**
## Accessibility Modifiers
A set of accessibility modifiers on this View ensures that the entire cell acts as a single accessible element, clearly announcing the content, favorite status, and purpose of the view.

- Combines all child elements into a single accessibility element to avoid redundant or repeated announcements.
- Sets a descriptive `accessibilityLabel` based on the cell title, and an `accessibilityValue` reflecting the current favorite status (e.g., "Favorite" or "Not Favorite").
- Adds an `accessibilityHint` to guide users, explaining that a standard double-tap opens the detail view and a two-finger double-tap (Magic Tap) toggles the favorite status.
- Declares the view as a button using `.accessibilityAddTraits(.isButton)`, aligning it with common VoiceOver interaction models.
- Implements a `.accessibilityAction(.magicTap)` to let VoiceOver users toggle the favorite state from anywhere on the cell using the Magic Tap gesture, improving discoverability and ease of use.
*/

struct CellView: View {
    @Binding var cell: Cell
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(cell.color)
                    .opacity(colorScheme == .dark ? 0.6 : 0.2)
                    .shadow(color: colorScheme == .dark ? .white : .black, radius: 8)
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
            .padding()
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
