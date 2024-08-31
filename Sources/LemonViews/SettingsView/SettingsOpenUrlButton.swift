//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/8/13.
//

import SwiftUI

public struct SettingsOpenUrlButton: View {
    private let title: LocalizedStringKey
    private let icon: String
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let urlString: String
    @Environment(\.openURL) private var openURL

    public init(title: LocalizedStringKey, icon: String, foregroundColor: Color, backgroundColor: Color = .blue, urlString: String) {
        self.title = title
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.urlString = urlString
    }

    public var body: some View {
        HStack {
            SettingIconView(icon: .system(icon: icon, foregroundColor: foregroundColor, backgroundColor: backgroundColor))

            Button(title) {
                if let url = URL(string: urlString) {
                    openURL(url)
                }
            }
            Spacer()
            SettingIconView(icon: .system(icon: "arrowshape.turn.up.right.fill", foregroundColor: .gray, backgroundColor: .clear))        }
    }
}

#Preview {
    List {
        SettingsOpenUrlButton(title: "给我们好评", icon: "star", foregroundColor: .white, urlString: "itms-apps://itunes.apple.com/app/id6504145207?action=write-review")
    }
}
