//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/9/7.
//

import SwiftUI

struct FullWidthButtonStyle: ButtonStyle {
    var backgroundColor: Color = .accentColor
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 12
    var verticalPadding: CGFloat = 8
    var pressedOpacity: Double = 0.8
    var pressedSaturation: Double = 0.8

    func makeBody(configuration: Configuration) -> some View {
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
