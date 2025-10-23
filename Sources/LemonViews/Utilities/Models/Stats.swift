//
//  Stats.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/23.
//

import Foundation

// MARK: - Stats

public struct Stats: Sendable {
    // MARK: Lifecycle

    public init(count: Int = 0, totalPrice: Double = 0) {
        self.count = count
        self.totalPrice = totalPrice
    }

    // MARK: Public

    public let count: Int
    public let totalPrice: Double
}

