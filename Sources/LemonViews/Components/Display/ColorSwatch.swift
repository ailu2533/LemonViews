//
//  ColorSwatch.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/23.
//

import SwiftUI

// MARK: - ColorSwatch

public struct ColorSwatch: View {
    // MARK: Lifecycle

    public init(color: UIColor) {
        self.color = color
    }

    // MARK: Public

    public let color: UIColor

    public var body: some View {
        Color(uiColor: color)
            .frame(width: 30, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.primary.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

