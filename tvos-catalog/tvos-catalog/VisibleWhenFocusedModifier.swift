//
//  VisibleWhenFocusedModifier.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct VisibleWhenFocusedModifier: ViewModifier {
    @Environment(\.isFocused) var isFocused

    func body(content: Content) -> some View {
        content.opacity(isFocused ? 1 : 0)
    }
}

extension View {
    func visibleWhenFocused() -> some View {
        modifier(VisibleWhenFocusedModifier())
    }
}

