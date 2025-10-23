//
//  DateRange.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/23.
//

import Foundation
import SwiftUI

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
