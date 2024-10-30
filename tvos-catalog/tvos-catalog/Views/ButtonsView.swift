//
//  ButtonsView.swift
//  tvos-catalog
//
//  Created by Rafael Afonso on 23/06/24.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Button("Bordered") {}
                Button("Bordered") {}
                    .buttonBorderShape(.capsule)
                Button {} label: {
                    Image(systemName: "movieclapper")
                }
                .buttonBorderShape(.circle)
            }

            Divider()

            HStack {
                Button("Bordered (tint)") {}
                Button("Bordered (tint)") {}
                    .buttonBorderShape(.capsule)
                Button {} label: {
                    Image(systemName: "movieclapper")
                }
                .buttonBorderShape(.circle)
            }
            .tint(.blue)

            Divider()

            HStack {
                Button("Prominent") {}
                Button("Prominent") {}
                    .buttonBorderShape(.capsule)
                Button {} label: {
                    Image(systemName: "movieclapper")
                }
                .buttonBorderShape(.circle)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)

            Divider()

            HStack {
                Button("Plain") {}
                Button {} label: {
                    Label("Labeled", systemImage: "movieclapper")
                }
                Button {} label: {
                    Image(systemName: "movieclapper")
                }
                .buttonBorderShape(.circle)
            }
            .buttonStyle(.plain)

            Divider()

            HStack {
                Button {} label: {
                    Image("discovery_portrait")
                        .resizable()
                        .frame(width: 250, height: 375)
                    Text("Borderless Portrait")
                }

                Button {} label: {
                    Image("discovery_landscape")
                        .resizable()
                        .frame(width: 400, height: 240)
                    Text("Borderless Landscape")
                }

                Button {} label: {
                    CodeSampleArtwork(size: .appIconSize)
                        .frame(width: 400, height: 240)
                        .hoverEffect(.highlight)
                    Text("Custom Icon View")
                }

                Button {} label: {
                    Image(systemName: "person.circle")
                        .font(.title)
                        .background(Color.blue.grayscale(0.7))
                        .hoverEffect(.highlight)
                    Text("Shaped")
                }
                .buttonBorderShape(.circle)
            }
            .buttonStyle(.borderless)

            Divider()

            VStack {
                HStack {
                    Button {} label: {
                        Label("A Card Button", systemImage: "button.horizontal")
                    }

                    Button {} label: {
                        Image("discovery_landscape")
                            .resizable()
                            .frame(width: 400, height: 240)
                            .overlay(alignment: .bottom) {
                                Text("Image Card")
                            }
                    }

                    Button {} label: {
                        VStack {
                            Image("discovery_landscape")
                                .resizable()
                                .frame(width: 400, height: 240)
                            Text("Vertical Card")
                        }
                    }
                }

                HStack {
                    Button {} label: {
                        VStack {
                            Image("discovery_landscape")
                                .resizable()
                                .frame(width: 400, height: 240)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text("Inset Card")
                        }
                        .padding(20)
                    }

                    Button {} label: {
                        VStack {
                            Image("discovery_landscape")
                                .resizable()
                                .frame(width: 400, height: 240)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text("Circle Card")
                        }
                        .padding(20)
                    }
                    .buttonBorderShape(.circle)
                }
            }
            .buttonStyle(.card)

            Divider()

            HStack {
                Button {} label: {
                    Label {
                        Text("Title at the bottom")
                            .font(.caption.bold())
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image("discovery_landscape")
                            .resizable()
                            .aspectRatio(400 / 240, contentMode: .fit)
                    }
                }
                .frame(maxWidth: 400)

                Button {} label: {
                    Label {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Title at the top")
                                .font(.body.bold())
                            Text("Some subtitle text as well")
                                .font(.caption)

                            Spacer()

                            Text("Additional info at the bottom")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    } icon: {
                        Image("discovery_landscape")
                            .resizable()
                            .aspectRatio(400 / 240, contentMode: .fit)
                    }
                }
                .frame(maxWidth: 400)
            }
            .buttonStyle(.card)
            .labelStyle(CardOverlayLabelStyle())
        }
    }
}

struct CardOverlayLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .bottomLeading) {
            configuration.icon
                .overlay {
                    LinearGradient(
                        stops: [
                            .init(color: .black.opacity(0.6), location: 0.1),
                            .init(color: .black.opacity(0.2), location: 0.25),
                            .init(color: .black.opacity(0), location: 0.4)
                        ],
                        startPoint: .bottom, endPoint: .top
                    )
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.quaternary)
                }

            configuration.title
                .padding(6)
        }
    }
}

#Preview {
    ButtonsView()
}
