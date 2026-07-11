//
//  InitView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI
import DesignSystem

struct InitView: View {
    let greetings = "Hello, Swift Surat"

    var body: some View {
        DebugPatternView("1. Init") {
            TextContainer(greetings)
        }
    }
}

#Preview {
    NavigationStack {
        InitView()
    }
}
