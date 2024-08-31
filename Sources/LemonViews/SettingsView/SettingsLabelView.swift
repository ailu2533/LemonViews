//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

public struct SettingsLabelView: View {
    let systemName: String
    let text: LocalizedStringKey
    let foregroundColor: Color
    let backgroundColor: Color

    public init(systemName: String, text: LocalizedStringKey, foregroundColor: Color = .white, backgroundColor: Color) {
        self.systemName = systemName
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        HStack {
            SettingIconView(icon: .system(icon: systemName, foregroundColor: foregroundColor, backgroundColor: backgroundColor))

            Text(text)
                .padding(.leading, 5)
        }
    }
}

#Preview {
    SettingsLabelView(systemName: "tshirt", text: "衣服", backgroundColor: .blue)
}
