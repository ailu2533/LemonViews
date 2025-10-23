//
//  TimeFormatStyle.swift
//  AudioConverter
//
//  Custom FormatStyle for formatting time in seconds to MM:SS format
//

import Foundation

/// A format style that converts a `Double` representing seconds into a "MM:SS" time string.
///
/// Example usage:
/// ```swift
/// Text(125.5, format: .time)  // Output: "2:05"
/// Text(65.0, format: .time)   // Output: "1:05"
/// Text(3661.0, format: .time) // Output: "61:01"
/// ```
public struct TimeFormatStyle: FormatStyle, Codable {
    public typealias FormatInput = Double
    public typealias FormatOutput = String

    public init() {}

    /// Formats a `Double` value (seconds) into a "MM:SS" string.
    ///
    /// - Parameter value: The time in seconds to format.
    /// - Returns: A formatted string in "M:SS" or "MM:SS" format.
    public func format(_ value: Double) -> String {
        let totalSeconds = Int(value)
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

// MARK: - FormatStyle Extension

public extension FormatStyle where Self == TimeFormatStyle {
    /// A format style for displaying time in "MM:SS" format.
    ///
    /// Use this with SwiftUI's `Text` view:
    /// ```swift
    /// Text(duration, format: .time)
    /// ```
    static var time: TimeFormatStyle {
        TimeFormatStyle()
    }
}

// MARK: - Double Extension (Optional Convenience)

public extension Double {
    /// Formats the double value (representing seconds) as a time string in "MM:SS" format.
    ///
    /// Example:
    /// ```swift
    /// let duration = 125.5
    /// let formatted = duration.formatted(.time) // "2:05"
    /// ```
    func formatted(_ style: TimeFormatStyle) -> String {
        style.format(self)
    }
}
