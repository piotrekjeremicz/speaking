//
//  InternalComponent.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

struct InternalComponent: View {
    @State private var isOn = false

    var body: some View {
        Button {
            isOn.toggle()
        } label: {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
        }
        .refreshGlow()
        .preference(key: InternalButtonPreferenceKey.self, value: isOn)
    }
}

#Preview {
    InternalComponent()
}
