//
//  TrailingCheckboxToggleStyle.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/3/6.
//

import SwiftUI

public struct TrailingCheckboxToggleStyle: ToggleStyle {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
                    .tint(.primary)
                    .contentTransition(.symbolEffect(.replace)) // 图标切换动画
                    .animation(.snappy(duration: 0.1), value: configuration.isOn) // 状态变化动画

                Spacer()
                Image(systemSymbol: configuration.isOn ? .checkmarkSquareFill : .square)
                    .fontWeight(.semibold)
            }
        }
        .sensoryFeedback(.selection, trigger: configuration.isOn)
    }
}
