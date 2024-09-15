//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/9/7.
//

import SwiftUI

public struct FullWidthButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    var verticalPadding: CGFloat
    var pressedOpacity: Double
    var pressedSaturation: Double

    public init(backgroundColor: Color = .accentColor,
                foregroundColor: Color = .white,
                cornerRadius: CGFloat = 12,
                verticalPadding: CGFloat = 10,
                pressedOpacity: Double = 0.8,
                pressedSaturation: Double = 0.8) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.verticalPadding = verticalPadding
        self.pressedOpacity = pressedOpacity
        self.pressedSaturation = pressedSaturation
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .maxWidth(.infinity)
            .padding(.vertical, verticalPadding)
            .contentShape(Rectangle())
            .background(
                backgroundColor
            )
            .saturation(configuration.isPressed ? pressedSaturation : 1)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        List {
            ForEach(1 ... 100, id: \.self) {
                Text("hello \($0)")
            }
        }
        Button(action: {}, label: {
            Text("Button")
        })
        .buttonStyle(FullWidthButtonStyle())
        .padding(.horizontal, 16)
    }
}
