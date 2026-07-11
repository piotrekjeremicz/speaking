//
//  ContainerValues+GrowthStage.swift
//  DesignSystem
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

public enum GrowthStage: Sendable {
    case seed
    case sprout
    case budding
    case bloom

    var title: String {
        switch self {
        case .seed: "Seed"
        case .sprout: "Sprout"
        case .budding: "Budding"
        case .bloom: "Bloom"
        }
    }

    var emoji: String {
        switch self {
        case .seed: "🌰"
        case .sprout: "🌱"
        case .budding: "🌿"
        case .bloom: "🌸"
        }
    }

    var height: CGFloat {
        switch self {
        case .seed: 40
        case .sprout: 60
        case .budding: 80
        case .bloom: 100
        }
    }
}

extension ContainerValues {
    @Entry public var growthStage: GrowthStage = .seed
}
