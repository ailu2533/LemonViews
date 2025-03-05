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
                Spacer()
                Image(systemSymbol: configuration.isOn ? .checkmarkSquareFill : .square)
                    .fontWeight(.semibold)
            }
        }
    }
}
