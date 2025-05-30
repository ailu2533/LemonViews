//
//  FloatingButtonStyle.swift
//
//
//  Created by Lu Ai on 2024/9/16.
//

import Foundation
import SwiftUI

public struct FloatingButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.isEnabled) private var isEnabled

    private enum Constants {
        static let fontSize: CGFloat = 16
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 10
        static let shadowRadius: CGFloat = 2
        static let shadowYOffset: CGFloat = 1
        static let pressedScale: CGFloat = 0.95
        static let disabledOpacity: CGFloat = 0.6
        static let animationDuration: Double = 0.2
        static let pressedOpacity: Double = 0.8
    }

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: Constants.fontSize, weight: .semibold, design: .rounded))
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.vertical, Constants.verticalPadding)
            .background(backgroundColor(for: configuration))
            .clipShape(Capsule())
            .foregroundStyle(foregroundColor(for: configuration))
            .shadow(color: shadowColor, radius: Constants.shadowRadius, x: 0, y: Constants.shadowYOffset)
            .scaleEffect(configuration.isPressed ? Constants.pressedScale : 1.0)
            .opacity(isEnabled ? 1.0 : Constants.disabledOpacity)
            .animation(.easeInOut(duration: Constants.animationDuration), value: configuration.isPressed)
    }

    private func backgroundColor(for configuration: Configuration) -> Color {
        if !isEnabled {
            return colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6)
        }
        return configuration.isPressed
            ? (colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
            : (colorScheme == .dark ? Color(.systemGray6) : .white)
    }

    private func foregroundColor(for configuration: Configuration) -> Color {
        if !isEnabled {
            return .gray
        }
        return configuration.isPressed ? .accentColor.opacity(Constants.pressedOpacity) : .accentColor
    }

    private var shadowColor: Color {
        colorScheme == .dark ? .black.opacity(0.2) : .gray.opacity(0.1)
    }
}
