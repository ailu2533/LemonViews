//
//  StatsItemView.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/23.
//

import SwiftUI

// MARK: - StatsItemView

public struct StatsItemView: View {
    // MARK: Lifecycle

    public init(stats: Stats) {
        self.stats = stats
    }

    // MARK: Public

    public var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            Text("\(stats.count)")
                .font(.headline)
            CurrencyText(value: stats.totalPrice)
        }
        .padding(.vertical, 4)
    }

    // MARK: Internal

    let stats: Stats
}

#Preview {
    StatsItemView(stats: .init(count: 12, totalPrice: 12.34))
}

