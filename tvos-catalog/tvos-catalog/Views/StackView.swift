//
//  StackView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct StackView: View {
    @State private var belowFold = false
    private var showcaseHeight: CGFloat = 800

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 26) {

                    VStack(alignment: .leading) {
                        Text("tvOS with SwiftUI")
                            .font(.largeTitle).bold()

                        Spacer()

                        HStack {
                            Button("Show") {}
                            NavigationLink("More Info…") {
                                Text("Hello")
                            }
                        }
                        .padding(.bottom, 80)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .focusSection()
                    .containerRelativeFrame(.vertical, alignment: .topLeading) {
                        length, _ in length * 0.8
                    }
                    .onScrollVisibilityChange { visible in
                        withAnimation {
                            belowFold = !visible
                        }
                    }

                    Section("Movie Shelf") {
                        MovieShelf()
                    }

                    Section("TV and Music Shelf") {
                        TVMusicShelf()
                    }

                    Section("Content Cards") {
                        CardShelf()
                    }
                }
                .scrollTargetLayout()
            }
            .background(alignment: .top) {
                HeroHeaderView(belowFold: belowFold)
            }
            .scrollTargetBehavior(
                FoldSnappingScrollTargetBehavior(
                    aboveFold: !belowFold, showcaseHeight: showcaseHeight))
            .scrollClipDisabled()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct FoldSnappingScrollTargetBehavior: ScrollTargetBehavior {
    var aboveFold: Bool
    var showcaseHeight: CGFloat

    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if aboveFold && target.rect.minY < showcaseHeight * 0.3 {
            return
        }

        if !aboveFold && target.rect.minY > showcaseHeight {
            return
        }

        let showcaseRevealThreshold = showcaseHeight * 0.7
        let snapToHideRange = showcaseRevealThreshold...showcaseHeight

        if aboveFold || snapToHideRange.contains(target.rect.origin.y) {
            target.rect.origin.y = showcaseHeight
        } else {
            target.rect.origin.y = 0
        }
    }
}

#Preview {
    StackView()
}
