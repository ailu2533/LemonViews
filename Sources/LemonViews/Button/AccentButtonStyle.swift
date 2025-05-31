//
//  AccentButtonStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/5/30.
//

import SwiftUI

// MARK: - AccentButtonStyle

public struct AccentButtonStyle: ButtonStyle {
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
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundStyle(Color.white)
            .background(Color.accentColor)
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

extension ButtonStyle where Self == AccentButtonStyle {
    public static var accent: AccentButtonStyle { AccentButtonStyle() }

    static func accent(
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        verticalPadding: CGFloat = 4,
        pressedOpacity: Double = 0.8
    ) -> AccentButtonStyle {
        AccentButtonStyle(
            cornerRadius: cornerRadius,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            pressedOpacity: pressedOpacity
        )
    }
}
