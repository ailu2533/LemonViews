//
//  SelectionCheckmark.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/5/18.
//
import SwiftUI

// MARK: - SelectionCheckmark

public struct SelectionCheckmark: View {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var body: some View {
        Image(systemSymbol: .checkmarkCircleFill)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.white, Color.accentColor)
            .background {
                Circle().stroke(Color.white, lineWidth: 2)
            }
    }
}
