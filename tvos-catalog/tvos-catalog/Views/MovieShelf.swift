//
//  MovieShelf.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct MovieShelf: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 40) {
                ForEach(Asset.allCases) { asset in
                    Button {} label: {
                        asset.portraitImage
                            .resizable()
                            .aspectRatio(250 / 375, contentMode: .fit)
                            .containerRelativeFrame(.horizontal, count: 6, spacing: 40)
                        Text(asset.title)
                    }
                }
            }
        }
        .scrollClipDisabled()
        .buttonStyle(.borderless)
    }
}

#Preview {
    MovieShelf()
}

