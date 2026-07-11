//
//  View+OnInternalButtonTapped.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public extension View {
    func onInternalButtonTapped(perform action: @escaping (Bool) -> Void) -> some View {
        onPreferenceChange(InternalButtonPreferenceKey.self, perform: action)
    }
}
