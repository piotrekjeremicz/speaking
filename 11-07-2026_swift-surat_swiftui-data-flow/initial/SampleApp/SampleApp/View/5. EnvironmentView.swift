//
//  EnvironmentView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI
import DesignSystem

extension EnvironmentValues {
    @Entry var boxValue: Int = 0
}

struct EnvironmentView: View {
    @State private var value = 0

    var body: some View {
        DebugPatternView("5. Environment Value") {
            VStack(spacing: 20) {
                BoxContainer {
                    BoxContainer {
                        BoxContent()
                    }
                }

                Stepper("value: \(value)", value: $value)
                    .fixedSize()
            }
        }
        .environment(\.boxValue, value)
    }
}

struct BoxContent: View {
    @Environment(\.boxValue) private var boxValue

    public init() {}

    public var body: some View {
        TextContainer("Value: \(boxValue)")
    }
}

#Preview {
    NavigationStack {
        EnvironmentView()
    }
}
