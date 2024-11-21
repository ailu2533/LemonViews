//
//  CapsuleButtonStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2024/10/28.
//

import SwiftUI

// 自定义胶囊按钮样式
public struct CapsuleButtonStyle: ButtonStyle {
    // MARK: Lifecycle

    public init(isSelected: Bool = false, textColor: Color, tagColor: Color = Color(.systemGray5)) {
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.textColor = textColor
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isSelected ? tagColor : Color(.systemGray6))
            .foregroundColor(textColor)
            .clipShape(Capsule())
            .font(.subheadline)
            .shadow(radius: 0.4)
    }

    // MARK: Internal

    let isSelected: Bool
    let tagColor: Color
    let textColor: Color
}