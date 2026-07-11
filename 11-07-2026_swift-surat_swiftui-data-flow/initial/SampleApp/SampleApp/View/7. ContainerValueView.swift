//
//  ContainerValueView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 11/07/2026.
//

import SwiftUI
import DesignSystem

struct ContainerValueView: View {
    var body: some View {
        DebugPatternView("7. Container Value") {
            GardenView {
                GrowthContainer(.budding)
                GrowthContainer(.sprout)
                GrowthContainer(.seed)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContainerValueView()
    }
}
