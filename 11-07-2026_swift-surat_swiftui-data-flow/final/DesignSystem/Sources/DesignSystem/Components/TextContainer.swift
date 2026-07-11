//
//  TextContainer.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct TextContainer: View {
    private let text: String

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .refreshGlow()
    }
}

#Preview {
    TextContainer("Hello, world!")
}
