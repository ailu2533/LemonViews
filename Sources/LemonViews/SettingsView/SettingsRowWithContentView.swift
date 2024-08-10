//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

struct NavigationIndicatorView: View {
    var body: some View {
        Image(systemName: "chevron.right")
            .imageScale(.small)
            .foregroundColor(Color(.systemGray2))
            .fontWeight(.semibold)
    }
}

public struct SettingsRowWithContentView<Content: View>: View {
    let icon: String
    let text: LocalizedStringKey
    let color: Color
    let action: () -> Void
    let content: () -> Content

    public init(icon: String, text: LocalizedStringKey, color: Color, action: @escaping () -> Void, content: @escaping () -> Content) {
        self.icon = icon
        self.text = text
        self.color = color
        self.action = action
        self.content = content
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                SettingsLabelView(systemName: icon, text: text, backgroundColor: color)
                Spacer()
                content()
                NavigationIndicatorView()
            }
        }
        .foregroundColor(.primary)
    }
}

#Preview {
    List {
        SettingsRowWithContentView(icon: "cabinet", text: "test", color: .blue) {
        } content: {
            Text("hello")
        }
    }
}
