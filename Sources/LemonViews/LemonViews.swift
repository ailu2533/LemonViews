// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct Stats: Sendable {
    public let count: Int
    public let totalPrice: Double

    public init(count: Int = 0, totalPrice: Double = 0) {
        self.count = count
        self.totalPrice = totalPrice
    }
}

public struct StatsItemView: View {
    let stats: Stats

    public init(stats: Stats) {
        self.stats = stats
    }

    public var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            Text("\(stats.count)")
                .font(.headline)
            CurrencyText(value: stats.totalPrice)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    StatsItemView(stats: .init(count: 12, totalPrice: 12.34))
}



public struct ColorSwatch: View {
    public let color: UIColor

    public init(color: UIColor) {
        self.color = color
    }

    public var body: some View {
        Color(uiColor: color)
            .frame(width: 30, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.primary.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}
