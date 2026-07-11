//
//  RefreshGlowModifier.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct RefreshGlowModifier: ViewModifier {
    private let cornerRadius: CGFloat
    private let glowColor = Color.randomGlow()

    public init(cornerRadius: CGFloat = 16) {
        self.cornerRadius = cornerRadius
    }

    public func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.background)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(glowColor, lineWidth: 3)
            )
            .shadow(color: glowColor.opacity(0.9), radius: 12)
            .animation(.easeInOut(duration: 0.35), value: glowColor)
    }
}

public extension View {
    /// Highlights re-renders of this view with a rounded rect and a
    /// randomly colored glow. Use it to visualize SwiftUI's diffing:
    /// the color only changes when this view's `body` is actually
    /// re-evaluated.
    func refreshGlow(cornerRadius: CGFloat = 16) -> some View {
        modifier(RefreshGlowModifier(cornerRadius: cornerRadius))
    }
}
