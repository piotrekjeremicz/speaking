//
//  ClosureTrapView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI
import DesignSystem

struct ClosureTrapView: View {
    @State private var trigger = 0

    var body: some View {
        DebugPatternView("4. Closure Trap") {
            VStack(spacing: 20) {
                TextContainer("Hello")

                TextClosureContainer("Hello") {
                    "World"
                }
                .refreshGlow()

                VStack(spacing: 4) {
                    Text("trigger: \(trigger)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)

                    Button("Force re-render") {
                        trigger += 1
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ClosureTrapView()
    }
}
