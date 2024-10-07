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
                verticalPadding: CGFloat = 14,
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
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .foregroundColor(configuration.role == .destructive ? .red : foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? pressedOpacity : 1)
            .saturation(configuration.isPressed ? pressedSaturation : 1)
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

        Button(role: .destructive, action: {}, label: {
            Text("Button")
        })
        .buttonStyle(FullWidthButtonStyle(backgroundColor:.orange))
        .padding(.horizontal, 16)
    }
}
