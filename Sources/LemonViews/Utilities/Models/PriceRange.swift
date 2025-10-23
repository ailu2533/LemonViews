//
//  PriceRange.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/23.
//

import Foundation
import SwiftUI

// MARK: - PriceRange

public struct PriceRange: Identifiable, Sendable {
    // MARK: Lifecycle

    public init(min: Int, max: Int?) {
        self.min = min
        self.max = max
    }

    // MARK: Public

    public static let priceRanges = [
        PriceRange(min: 0, max: 50),
        PriceRange(min: 50, max: 100),
        PriceRange(min: 100, max: 200),
        PriceRange(min: 200, max: 300),
        PriceRange(min: 300, max: 500),
        PriceRange(min: 500, max: 1000),
        PriceRange(min: 1000, max: nil)
    ]

    public let id = UUID()
    public let min: Int
    public let max: Int?

    public var description: LocalizedStringKey {
        if let max {
            "\(min)到\(max)"
        } else {
            "\(min)以上"
        }
    }
}

