//
//  PublicComponent.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct PublicComponent: View {
    private let text: String

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        HStack(spacing: 12) {
            Text(text)
            Spacer()
            InternalComponent()
        }
        .refreshGlow()
    }
}

#Preview {
    PublicComponent("Make light!")
        .onInternalButtonTapped { value in
            print("Tapped! Value: \(value)")
        }
}
