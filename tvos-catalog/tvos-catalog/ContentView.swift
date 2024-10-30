//
//  ContentView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Stack", systemImage: "line.3.horizontal") {
                StackView()
            }

            Tab("Buttons", systemImage: "button.horizontal") {
                ButtonsView()
            }

            Tab("Description", systemImage: "text.quote") {
                DescriptionView()
            }

            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }
        }
    }
}

#Preview {
    ContentView()
}
