//
//  BitrateFormatStyle.swift
//  AudioConverter
//
//  Created by Augment Agent on 2025/10/22.
//

import Foundation

/// Modern FormatStyle for displaying bitrates in kbps or Mbps format
/// Converts bps (bits per second) values to kbps or Mbps with whole numbers only
public struct BitrateFormatStyle: FormatStyle, Codable {
    public typealias FormatInput = Int64
    public typealias FormatOutput = String

    public init() {}

    private var measurementFormatter: MeasurementFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")

        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.numberFormatter = numberFormatter

        return formatter
    }

    /// Formats an Int64 bitrate value (in bps) to a string (in kbps or Mbps)
    /// - Parameter value: Bitrate in bits per second
    /// - Returns: Formatted string like "320 kbps" or "1 Mbps"
    public func format(_ value: Int64) -> String {
        let bps = Double(value)
        let measurement = Measurement(value: bps, unit: UnitBitrate.bitsPerSecond)
        let display: Measurement<UnitBitrate>

        display = measurement.converted(to: .kilobitsPerSecond)

        return measurementFormatter.string(from: display)
    }
}

// MARK: - Convenience Extension

public extension FormatStyle where Self == BitrateFormatStyle {
    /// Convenient static property for bitrate formatting
    /// Usage: `Text(audioBitrate, format: .bitrate)`
    static var bitrate: BitrateFormatStyle {
        BitrateFormatStyle()
    }
}
