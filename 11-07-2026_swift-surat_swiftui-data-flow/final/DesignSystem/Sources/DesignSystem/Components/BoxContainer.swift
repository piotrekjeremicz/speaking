//
//  BoxContainer.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public struct BoxContainer<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding()
            .refreshGlow()
    }
}
