//
//  TimeFormatStyle.swift
//  AudioConverter
//
//  Custom FormatStyle for formatting time in seconds to MM:SS format
//

import Foundation

/// A format style that converts a `Double` representing seconds into a time string.
/// - For times < 1 hour: "MM:SS" format
/// - For times >= 1 hour: "HH:mm:ss" format
///
/// Example usage:
/// ```swift
/// Text(125.5, format: .time)  // Output: "2:05"
/// Text(65.0, format: .time)   // Output: "1:05"
/// Text(3661.0, format: .time) // Output: "1:01:01"
/// ```
public struct TimeFormatStyle: FormatStyle, Codable {
    public typealias FormatInput = Double
    public typealias FormatOutput = String

    public init() {}

    /// Formats a `Double` value (seconds) into a time string.
    /// - For times < 1 hour: "M:SS" or "MM:SS" format
    /// - For times >= 1 hour: "H:mm:ss" or "HH:mm:ss" format
    ///
    /// - Parameter value: The time in seconds to format.
    /// - Returns: A formatted time string.
    public func format(_ value: Double) -> String {
        let totalSeconds = Int(value)

        if totalSeconds >= 3600 {
            // Format as HH:mm:ss for times >= 1 hour
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds % 3600) / 60
            let seconds = totalSeconds % 60
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            // Format as MM:SS for times < 1 hour
            let minutes = totalSeconds / 60
            let seconds = totalSeconds % 60
            return String(format: "%d:%02d", minutes, seconds)
        }
    }
}

// MARK: - FormatStyle Extension

public extension FormatStyle where Self == TimeFormatStyle {
    /// A format style for displaying time.
    /// - For times < 1 hour: "MM:SS" format
    /// - For times >= 1 hour: "HH:mm:ss" format
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
    /// Formats the double value (representing seconds) as a time string.
    /// - For times < 1 hour: "MM:SS" format
    /// - For times >= 1 hour: "HH:mm:ss" format
    ///
    /// Example:
    /// ```swift
    /// let duration = 125.5
    /// let formatted = duration.formatted(.time) // "2:05"
    /// let longDuration = 3661.0
    /// let formattedLong = longDuration.formatted(.time) // "1:01:01"
    /// ```
    func formatted(_ style: TimeFormatStyle) -> String {
        style.format(self)
    }
}

