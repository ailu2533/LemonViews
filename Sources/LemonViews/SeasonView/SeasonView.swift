//
//  SeasonView.swift
//  LemonThingsManager
//
//  Created by ailu on 2024/7/1.
//

import Foundation
import SwiftUI

// MARK: - Season

public struct Season: Identifiable, Hashable, Sendable {
    // MARK: Lifecycle

    public init(symbolName: String, name: String, bitmask: Int, color: Color) {
        self.symbolName = symbolName
        self.name = name
        self.bitmask = bitmask
        self.color = color
    }

    // MARK: Public

    public static let seasons = [
        Season(symbolName: "leaf.fill", name: "春", bitmask: 1, color: .green),
        Season(symbolName: "sun.max.fill", name: "夏", bitmask: 2, color: .yellow),
        Season(symbolName: "leaf.fill", name: "秋", bitmask: 4, color: .orange),
        Season(symbolName: "snowflake", name: "冬", bitmask: 8, color: .blue)
    ]

    public static let allSeasons = [
        Season(symbolName: "leaf.fill", name: "春", bitmask: 1, color: .green),
        Season(symbolName: "sun.max.fill", name: "夏", bitmask: 2, color: .yellow),
        Season(symbolName: "leaf.fill", name: "秋", bitmask: 4, color: .orange),
        Season(symbolName: "snowflake", name: "冬", bitmask: 8, color: .blue),
        Season(symbolName: "circle.grid.2x2.fill", name: "四季", bitmask: 15, color: .purple)
    ]

    public let symbolName: String
    public let name: String
    public let bitmask: Int
    public let color: Color // 添加颜色属性

    public var id: Int {
        bitmask
    }
}

// MARK: - SeasonSectionRowView

public struct SeasonSectionRowView: View {
    // MARK: Lifecycle

    public init(selectedSeason: Binding<Int>, callback: @escaping () -> Void) {
        _selectedSeason = selectedSeason
        self.callback = callback
    }

    // MARK: Public

    public var body: some View {
        SettingsRowWithContentView(icon: .thermometerMedium, text: "季节", color: .blue) {
            callback()
        } content: {
            SeasonTextView(season: selectedSeason)
        }
    }

    // MARK: Internal

    @Binding var selectedSeason: Int // 确保这是一个绑定属性，以便在视图外部更新

    let callback: () -> Void
}
