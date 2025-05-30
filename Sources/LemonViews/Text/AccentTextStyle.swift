//
//  AccentTextStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/5/30.
//

import SwiftUI

// MARK: - AccentTextStyle

struct AccentTextStyle: ViewModifier {
    // MARK: Lifecycle

    init(
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        verticalPadding: CGFloat = 4
    ) {
        self.cornerRadius = cornerRadius
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }

    // MARK: Internal

    let cornerRadius: CGFloat
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundStyle(Color.systemBackground)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func accentTextStyle(
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        verticalPadding: CGFloat = 4
    ) -> some View {
        modifier(AccentTextStyle(
            cornerRadius: cornerRadius,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding
        ))
    }
}

// 为 Text 提供更便捷的扩展
public extension Text {
    @MainActor func accentStyle(
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        verticalPadding: CGFloat = 4
    ) -> some View {
        accentTextStyle(
            cornerRadius: cornerRadius,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding
        )
    }
}
