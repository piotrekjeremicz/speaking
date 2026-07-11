//
//  PreferenceValueView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 11/07/2026.
//

import SwiftUI
import DesignSystem

struct PreferenceValueView: View {
    var body: some View {
        DebugPatternView("6. Preference Value") {
            PublicComponent("Make light!")
                .padding()
                .onInternalButtonTapped { value in
                    print("Tapped! Value: \(value)")
                }
        }
    }
}

#Preview {
    NavigationStack {
        PreferenceValueView()
    }
}
