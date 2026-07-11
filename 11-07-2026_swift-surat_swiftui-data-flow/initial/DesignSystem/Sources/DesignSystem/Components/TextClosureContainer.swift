//
//  TextClosureContainer.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct TextClosureContainer: View {
    private let text: String
    private let content: () -> String

    public init(_ text: String, content: @escaping () -> String) {
        self.text = text
        self.content = content
    }

    public var body: some View {
        Text("\(text): \(content())")
    }
}

#Preview {
    TextClosureContainer("Hello") {
        "World"
    }
}
