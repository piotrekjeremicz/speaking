//
//  GardenView.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct GardenView<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Group(subviews: content) { subviews in
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(subviews) { subview in
                    VStack(spacing: 8) {
                        Text(subview.containerValues.growthStage.emoji)
                        subview
                    }
                    .frame(width: 70, height: subview.containerValues.growthStage.height)
                    .refreshGlow()
                }
            }
        }
    }
}

#Preview {
    GardenView {
        GrowthContainer(.bloom)
        GrowthContainer(.budding)
        GrowthContainer(.sprout)
    }
}
