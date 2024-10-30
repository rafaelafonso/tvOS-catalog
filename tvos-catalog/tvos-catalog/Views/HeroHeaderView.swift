//
//  HeroHeaderView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct HeroHeaderView: View {
    var belowFold: Bool

    var body: some View {
        Image("beach_landscape")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay {
                Rectangle()
                    .fill(.regularMaterial)
                    .mask {
                        maskView
                    }
            }
            .ignoresSafeArea()
    }

    var maskView: some View {
        LinearGradient(
            stops: [
                .init(color: .black, location: 0.25),
                .init(color: .black.opacity(belowFold ? 1 : 0.3), location: 0.375),
                .init(color: .black.opacity(belowFold ? 1 : 0), location: 0.5)
            ],
            startPoint: .bottom, endPoint: .top
        )
    }
}

#Preview {
    HeroHeaderView(belowFold: false)
}

#Preview {
    HeroHeaderView(belowFold: true)
}

