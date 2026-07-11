//
//  GrowthContainer.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct GrowthContainer: View {
    private let stage: GrowthStage

    public init(_ stage: GrowthStage) {
        self.stage = stage
    }

    public var body: some View {
        Text(stage.title)
            .containerValue(\.growthStage, stage)
    }
}

#Preview {
    GardenView {
        GrowthContainer(.bloom)
        GrowthContainer(.budding)
        GrowthContainer(.sprout)
    }
}
