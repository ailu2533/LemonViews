//
//  SampleRateFormatStyle.swift
//  AudioConverter
//
//  Created by Augment Agent on 2025/10/22.
//

import Foundation

/// Modern FormatStyle for displaying sample rates in kHz format
/// Converts Hz values to kHz with up to 1 decimal place
public struct SampleRateFormatStyle: FormatStyle, Codable {
    public typealias FormatInput = Int64
    public typealias FormatOutput = String

    public init() {}

    private var measurementFormatter: MeasurementFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")

        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.numberFormatter = numberFormatter

        return formatter
    }

    /// Formats an Int64 sample rate value (in Hz) to a string (in kHz)
    /// - Parameter value: Sample rate in Hz
    /// - Returns: Formatted string like "44.1 kHz" or "48 kHz"
    public func format(_ value: Int64) -> String {
        let measurement = Measurement(value: Double(value), unit: UnitFrequency.hertz)
            .converted(to: .kilohertz)

        return measurementFormatter.string(from: measurement)
    }
}

// MARK: - Convenience Extension

public extension FormatStyle where Self == SampleRateFormatStyle {
    /// Convenient static property for sample rate formatting
    /// Usage: `Text(audioSampleRate, format: .sampleRate)`
    static var sampleRate: SampleRateFormatStyle {
        SampleRateFormatStyle()
    }
}
