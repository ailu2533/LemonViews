//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

public struct SettingsRowView: View {
    let icon: String
    let text: LocalizedStringKey
    let color: Color
    let action: () -> Void

    public init(icon: String, text: LocalizedStringKey, color: Color, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                SettingsLabelView(systemName: icon, text: text, backgroundColor: color)
                Spacer()
                NavigationIndicatorView()
            }
        }
        .foregroundColor(.primary)
    }
}

#Preview {
    NavigationStack {
        List {
            SettingsRowView(icon: "cabinet", text: "衣橱", color: .yellow) {
            }

            SettingsRowView(icon: "cabinet", text: "Tag Management", color: .blue) {
            }
        }
    }
}

public struct SettingsRowNoImageBorderView: View {
    let icon: String
    let text: LocalizedStringKey
    let color: Color
    let action: () -> Void

    public init(icon: String, text: LocalizedStringKey, color: Color, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                FormIconView(systemName: icon, size: 16)
                Text(text)
                Spacer()
                NavigationIndicatorView()
            }
        }
        .foregroundColor(.primary)
    }
}
