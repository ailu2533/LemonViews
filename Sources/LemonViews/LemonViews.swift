// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

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

// MARK: - ColorSwatch

public struct ColorSwatch: View {
    // MARK: Lifecycle

    public init(color: UIColor) {
        self.color = color
    }

    // MARK: Public

    public let color: UIColor

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

// MARK: - DateRange

public struct DateRange: Identifiable, Sendable {
    // MARK: Lifecycle

    public init(duration: Int, unit: Calendar.Component) {
        self.duration = duration
        self.unit = unit
    }

    // MARK: Public

    public static let dateRanges = [
        DateRange(duration: 7, unit: .day),
        DateRange(duration: 1, unit: .month),
        DateRange(duration: 3, unit: .month),
        DateRange(duration: 6, unit: .month),
        DateRange(duration: 1, unit: .year),
    ]

    public let id = UUID()

    public var description: LocalizedStringKey {
        switch unit {
        case .day:
            "最近1周"
        case .month:
            duration == 1 ? "最近1个月" : "最近\(duration)个月"
        case .year:
            "最近1年"
        default:
            ""
        }
    }

    public func getStartDate() -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: unit, value: -duration, to: Date()) ?? Date()
    }

    // MARK: Internal

    let duration: Int
    let unit: Calendar.Component
}

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
        PriceRange(min: 1000, max: nil),
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
