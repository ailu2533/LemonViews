//
//  ColorButton.swift
//  LemonViews
//
//  Created by Lu Ai on 2024/10/28.
//

import SwiftUI

public struct ColorButton: View {
    // MARK: Lifecycle

    public init(color: Color, isSelected: Bool) {
        self.color = color
        self.isSelected = isSelected
    }

    // MARK: Public

    public var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(color)
            .frame(width: 30, height: 30)
            .shadow(radius: 1)
            .scaleEffect(isSelected ? 0.7 : 1, anchor: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
            )
    }

    // MARK: Internal

    let color: Color
    let isSelected: Bool
}
