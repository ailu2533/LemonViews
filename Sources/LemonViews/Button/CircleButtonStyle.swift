//
//  CircleButtonStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/6/5.
//

import SwiftUI

// MARK: - CircleButtonStyle

public struct CircleButtonStyle: ButtonStyle {
    // MARK: Lifecycle

    public init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(Color.white)
            .frame(width: 44, height: 44)
            .background {
                ZStack {
                    Circle()
                        .fill(backgroundColor.gradient.opacity(configuration.isPressed ? 0.8 : 1))

                    Circle()
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                }
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3), value: configuration.isPressed)
    }

    // MARK: Private

    private let backgroundColor: Color
}
