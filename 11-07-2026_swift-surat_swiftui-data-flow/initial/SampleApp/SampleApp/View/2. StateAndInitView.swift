//
//  StateAndInitView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI
import DesignSystem

struct StateAndInitView: View {
    @State private var value = 0

    var body: some View {
        DebugPatternView("2. State + Init") {
            HStack(spacing: 20) {
                TextContainer("Count: \(value)")

                Button {
                    value += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        StateAndInitView()
    }
}
