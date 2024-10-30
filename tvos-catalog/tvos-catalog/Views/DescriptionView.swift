//
//  DescriptionView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Id cursus metus aliquam eleifend. Sem et tortor consequat id porta nibh venenatis cras sed. Volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Tincidunt eget nullam non nisi est sit amet facilisis magna. Etiam sit amet nisl purus in mollis nunc sed id. Proin nibh nisl condimentum id venenatis. Etiam erat velit scelerisque in. Ultricies leo integer malesuada nunc vel risus. Sed lectus vestibulum mattis ullamcorper velit sed. Turpis tincidunt id aliquet risus feugiat in. Volutpat diam ut venenatis tellus. Tortor consequat id porta nibh venenatis cras sed felis. Vulputate eu scelerisque felis imperdiet proin. Viverra tellus in hac habitasse platea dictumst vestibulum rhoncus est. Pharetra et ultrices neque ornare aenean. Curabitur vitae nunc sed velit dignissim sodales ut."

struct DescriptionView: View {
    @State var showDescription = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .font(.largeTitle)
                .bold()

            Spacer()

            VStack(spacing: 12) {
                Text("Signup information")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(alignment: .top, spacing: 30) {
                    VStack(spacing: 12) {
                        Button {} label: {
                            Text("Sign Up")
                                .font(.body.bold())
                                .frame(maxWidth: .infinity)
                        }

                        Button {} label: {
                            Text("Buy or Rent")
                                .font(.body.bold())
                                .frame(maxWidth: .infinity)
                        }

                        Button {} label: {
                            Label("Add to Up Next", systemImage: "plus")
                                .font(.body.bold())
                                .frame(maxWidth: .infinity)
                        }
                    }

                    Button {
                        showDescription = true
                    } label: {
                        Text(loremIpsum)
                            .font(.callout)
                            .lineLimit(5)
                    }
                    .buttonStyle(.plain)
                    .frame(width: 1000)

                    VStack(spacing: 0) {
                        Text("Starring")
                            .foregroundStyle(.secondary) + Text(" Stars, Costars, and Extras")
                        Text("Director")
                            .foregroundStyle(.secondary) + Text(" Someone Great")
                    }
                }
            }
            .padding(.top)
        }
        .background {
            Asset.beach.landscapeImage
                .aspectRatio(contentMode: .fill)
                .overlay {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask {
                            LinearGradient(
                                stops: [
                                    .init(color: .white, location: 0.2),
                                    .init(color: .white.opacity(0.7), location: 0.4),
                                    .init(color: .white.opacity(0), location: 0.56),
                                    .init(color: .white.opacity(0), location: 0.7),
                                    .init(color: .white.opacity(0.25), location: 0.8)
                                ],
                                startPoint: .bottom, endPoint: .top
                            )
                        }
                }
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $showDescription) {
            VStack(alignment: .center) {
                Text(loremIpsum)
                    .frame(maxWidth: 600)
            }
        }
    }
}

#Preview {
    DescriptionView()
}
