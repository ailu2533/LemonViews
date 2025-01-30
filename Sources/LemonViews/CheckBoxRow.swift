//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI
import SFSafeSymbols

public struct CheckBoxRow: View {
    let systemName: SFSymbol?
    let title: String
    let isChecked: Bool
    let callback: () -> Void

    public init(
        systemName: SFSymbol? = nil,
        title: String,
        isChecked: Bool,
        callback: @escaping () -> Void
    ) {
        self.title = title
        self.isChecked = isChecked
        self.callback = callback
        self.systemName = systemName
    }

    public var body: some View {
        Button {
            callback()
        } label: {
            HStack {
                if let systemName {
                    SettingIconView(icon: .system(icon: systemName, foregroundColor: .primary, backgroundColor: Color(.systemGray5)))
                }

                Text(title)
                Spacer()
                Image(systemName: isChecked ?
                    "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.accentColor)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    List {
        CheckBoxRow(title: "test", isChecked: true) {
        }

        CheckBoxRow(title: "test", isChecked: false) {
        }
    }
}
