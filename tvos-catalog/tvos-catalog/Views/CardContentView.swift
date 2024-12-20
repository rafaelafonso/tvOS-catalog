//
//  CardContentView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct CardContentView: View {
    var asset: Asset

    var body: some View {
                HStack(alignment: .top, spacing: 10) {
                    asset.landscapeImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading) {
                        Text(asset.title)
                            .font(.body)
                        Text("Subtitle text goes here, limited to two lines")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                        Spacer(minLength: 0)
                        HStack(spacing: 4) {
                            ForEach(1..<4) { _ in
                                Image(systemName: "ellipsis.rectangle.fill")
                            }
                        }
                        .foregroundStyle(.secondary)
                    }
                }
    }
}

#Preview {
    CardContentView(asset: .botanist)
}

