//
//  Color+Random.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

extension Color {
    static func randomGlow() -> Color {
        Color(
            hue: .random(in: 0...1),
            saturation: .random(in: 0.6...0.9),
            brightness: .random(in: 0.85...1.0)
        )
    }
}
