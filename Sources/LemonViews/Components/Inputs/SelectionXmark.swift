//
//  SelectionXmark.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/5/18.
//
import SwiftUI

// MARK: - SelectionXmark

public struct SelectionXmark: View {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var body: some View {
        Image(systemSymbol: .xmarkCircleFill)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.white, Color.red)
            .background {
                Circle().stroke(Color.white, lineWidth: 2)
            }
    }
}
