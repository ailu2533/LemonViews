//
//  SettingsRowWithContentView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SFSafeSymbols
import SwiftUI

// MARK: - NavigationIndicatorView

struct NavigationIndicatorView: View {
    var body: some View {
        Image(systemName: "chevron.right")
            .imageScale(.small)
            .foregroundColor(Color(.systemGray2))
            .fontWeight(.semibold)
    }
}

// MARK: - SettingsRowWithContentView

public struct SettingsRowWithContentView<Content: View>: View {
    // MARK: Public

    public var body: some View {
        Button(action: action) {
            HStack {
                SettingsLabelView(
                    systemName: icon,
                    text: text,
                    backgroundColor: color
                )
                Spacer()
                content()
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
    @ViewBuilder var content: () -> Content
}

#Preview {
    List {
        SettingsRowWithContentView(icon: .cabinet, text: "test", color: .blue) {} content: {
            Text("hello")
        }
    }
}
