//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SFSafeSymbols
import SwiftUI

// MARK: - SettingsRowView

public struct SettingsRowView: View {
    // MARK: Lifecycle

    public init(
        icon: SFSymbol,
        text: LocalizedStringKey,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.text = text
        self.color = color
        self.action = action
    }

    // MARK: Public

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

    // MARK: Internal

    let icon: SFSymbol
    let text: LocalizedStringKey
    let color: Color
    let action: () -> Void
}

#Preview {
    NavigationStack {
        List {
            SettingsRowView(icon: .cabinet, text: "衣橱", color: .yellow) {
            }

            SettingsRowView(icon: .cabinet, text: "Tag Management", color: .blue) {
            }
        }
    }
}

// MARK: - SettingsRowNoImageBorderView

public struct SettingsRowNoImageBorderView: View {
    // MARK: Lifecycle

    public init(
        icon: SFSymbol,
        text: LocalizedStringKey,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.text = text
        self.color = color
        self.action = action
    }

    // MARK: Public

    public var body: some View {
        Button(action: action) {
            HStack {
                FormIconView(systemSymbol: icon, size: 16)
                Text(text)
                Spacer()
                NavigationIndicatorView()
            }
        }
        .foregroundColor(.primary)
    }

    // MARK: Internal

    let icon: SFSymbol
    let text: LocalizedStringKey
    let color: Color
    let action: () -> Void
}
