//
//  UnitBitrate.swift
//  AudioConverter
//
//  Created by Augment Agent on 2025/10/22.
//

import Foundation

/// Custom unit for measuring bitrate in audio files
public final class UnitBitrate: Dimension, @unchecked Sendable {
    /// Bits per second (base unit)
    public static let bitsPerSecond = UnitBitrate(
        symbol: "bps",
        converter: UnitConverterLinear(coefficient: 1)
    )

    /// Kilobits per second (1 kbps = 1,000 bps)
    public static let kilobitsPerSecond = UnitBitrate(
        symbol: "kbps",
        converter: UnitConverterLinear(coefficient: 1000)
    )

    /// Megabits per second (1 Mbps = 1,000,000 bps)
    public static let megabitsPerSecond = UnitBitrate(
        symbol: "Mbps",
        converter: UnitConverterLinear(coefficient: 1_000_000)
    )

    override public class func baseUnit() -> UnitBitrate {
        .bitsPerSecond
    }
}
