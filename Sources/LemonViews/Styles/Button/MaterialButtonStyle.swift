//
//  MaterialButtonStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/6/5.
//

import SwiftUI

// MARK: - MaterialButtonStyle

public struct MaterialButtonStyle: ViewModifier {
    // MARK: Lifecycle

    public init(cornerRadius: CGFloat = 12, minWidth: CGFloat = 44) {
        self.cornerRadius = cornerRadius
        self.minWidth = minWidth
    }

    // MARK: Public

    public func body(content: Content) -> some View {
        content
            .font(.callout)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .frame(minWidth: minWidth)
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    // MARK: Internal

    let cornerRadius: CGFloat
    let minWidth: CGFloat
}

public extension View {
    func materialButtonStyle(
        cornerRadius: CGFloat = 12,
        minWidth: CGFloat = 44
    ) -> some View {
        modifier(
            MaterialButtonStyle(
                cornerRadius: cornerRadius,
                minWidth: minWidth
            ))
    }
}
