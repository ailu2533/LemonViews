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
    let backgroundColor: Color

    public init(systemName: String, text: LocalizedStringKey, backgroundColor: Color) {
        self.systemName = systemName
        self.text = text
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        HStack {
            Image(systemName: systemName)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            Text(text)
                .padding(.leading, 5)
        }
    }
}

#Preview {
    SettingsLabelView(systemName: "tshirt", text: "衣服", backgroundColor: .blue)
}
