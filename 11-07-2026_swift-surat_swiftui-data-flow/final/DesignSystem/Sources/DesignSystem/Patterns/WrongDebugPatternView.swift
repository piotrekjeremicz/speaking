//
//  WrongDebugPatternView.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct WrongDebugPatternView<Content: View>: View {
    private let title: String
    private let content: () -> Content

    @State private var random = Int.random(in: 0...999)

    public init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    public var body: some View {
        let circleColor = Color.randomGlow()

        ZStack {
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button("Refresh") {
                    random = Int.random(in: 0...999)
                }
                .buttonStyle(.borderedProminent)

                Spacer()

                Text("control: \(random)")
                    .font(.caption2)
                    .contentTransition(.numericText())
                    .animation(.default, value: random)

                Circle()
                    .fill(circleColor)
                    .frame(width: 12, height: 12)
                    .animation(.easeInOut(duration: 0.3), value: circleColor)
            }
            .padding()
            .background(.bar)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DebugPatternView("1. Initialization") {
            Text("Hello, world!")
        }
    }
}
