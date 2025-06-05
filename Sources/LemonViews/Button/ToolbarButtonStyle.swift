//
//  ToolbarButtonStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/6/5.
//
import SwiftUI

// MARK: - ToolbarButtonStyle

public struct ToolbarButtonStyle: ButtonStyle {
    // MARK: Lifecycle

    init(
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        verticalPadding: CGFloat = 4,
        pressedOpacity: Double = 0.8
    ) {
        self.cornerRadius = cornerRadius
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.pressedOpacity = pressedOpacity
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundStyle(.primary)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .opacity(configuration.isPressed ? pressedOpacity : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }

    // MARK: Internal

    let cornerRadius: CGFloat
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let pressedOpacity: Double
}
