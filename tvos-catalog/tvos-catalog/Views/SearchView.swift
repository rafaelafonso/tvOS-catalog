//
//  SearchView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 40), count: 4)

struct SearchView: View {
    @State var searchTerm: String = ""
    var assets: [String: [Asset]] = Asset.lookupTable

    var matchingAssets: [Asset] {
        if searchTerm.isEmpty {
            assets.values
                .flatMap { $0 }
                .reduce(into: []) {
                    if !$0.contains($1) {
                        $0.append($1)
                    }
                }
        } else {
            assets
                .filter { $0.key.contains(searchTerm) }
                .flatMap { $0.value }
                .reduce(into: []) {
                    if !$0.contains($1) {
                        $0.append($1)
                    }
                }
        }
    }

    var sortedMatchingAssets: [Asset] {
        matchingAssets
            .sorted(using: SortDescriptor(\.title, comparator: .lexical))
    }

    var suggestedSearchTerms: [String] {
        guard !searchTerm.isEmpty else { return [] }
        return assets.keys.filter { $0.contains(searchTerm) }
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(sortedMatchingAssets) { asset in
                    Button {} label: {
                        asset.landscapeImage
                            .resizable()
                            .aspectRatio(16 / 9, contentMode: .fit)
                        Text(asset.title)
                    }
                }
            }
            .buttonStyle(.borderless)
        }
        .scrollClipDisabled()
        .searchable(text: $searchTerm)
        .searchSuggestions {
            ForEach(suggestedSearchTerms, id: \.self) { suggestion in
                Text(suggestion)
            }
        }
    }
}

#Preview {
    SearchView()
}

