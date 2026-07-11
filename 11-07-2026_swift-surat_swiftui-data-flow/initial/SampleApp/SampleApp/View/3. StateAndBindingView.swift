//
//  StateAndBindingView.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI
import DesignSystem

struct StateAndBindingView: View {
    @State private var basket: [String] = []

    var body: some View {
        DebugPatternView("3. State + Binding") {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Basket")
                        Spacer()
                        Button {
                            basket = []
                        } label: {
                            Image(systemName: "trash")
                        }
                    }

                    Text(basket.joined(separator: " "))
                }
                .refreshGlow()

                Button {
                    basket.append("🍓")
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        StateAndBindingView()
    }
}
