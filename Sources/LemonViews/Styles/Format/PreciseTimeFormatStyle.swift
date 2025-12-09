//
//  PreciseTimeFormatStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/12/9.
//
import Foundation

public struct PreciseTimeFormatStyle: FormatStyle, Codable {
    public typealias FormatInput = Double
    public typealias FormatOutput = String

    public init() {}

    /// Formats a `Double` value (seconds) into a time string.
    /// - For times < 1 hour: "M:SS.s" or "MM:SS.s" format
    /// - For times >= 1 hour: "H:mm:ss.s" or "HH:mm:ss.s" format
    ///
    /// - Parameter value: The time in seconds to format.
    /// - Returns: A formatted time string.
    public func format(_ value: Double) -> String {
        let totalSeconds = value

        if totalSeconds >= 3600 {
            // Format as HH:mm:ss.s for times >= 1 hour
            let hours = Int(totalSeconds / 3600)
            let minutes = Int((totalSeconds.truncatingRemainder(dividingBy: 3600)) / 60)
            let seconds = totalSeconds.truncatingRemainder(dividingBy: 60)
            return String(format: "%d:%02d:%04.1f", hours, minutes, seconds)
        } else {
            // Format as MM:SS.s for times < 1 hour
            let minutes = Int(totalSeconds / 60)
            let seconds = totalSeconds.truncatingRemainder(dividingBy: 60)
            return String(format: "%d:%04.1f", minutes, seconds)
        }
    }
}

// MARK: - FormatStyle Extension

public extension FormatStyle where Self == PreciseTimeFormatStyle {
    /// A format style for displaying time.
    /// - For times < 1 hour: "MM:SS" format
    /// - For times >= 1 hour: "HH:mm:ss" format
    ///
    /// Use this with SwiftUI's `Text` view:
    /// ```swift
    /// Text(duration, format: .time)
    /// ```
    static var preciseTime: PreciseTimeFormatStyle {
        PreciseTimeFormatStyle()
    }
}

import SwiftUI

#Preview {
    Text(4.2, format: .preciseTime)
}
