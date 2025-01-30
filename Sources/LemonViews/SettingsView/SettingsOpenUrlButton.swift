//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/8/13.
//

import SwiftUI

public struct SettingsOpenURLButton: View {
    // MARK: Lifecycle

    public init(title: LocalizedStringKey, icon: String, foregroundColor: Color, backgroundColor: Color = .blue, urlString: String) {
        self.title = title
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.urlString = urlString
    }

    // MARK: Public

    public var body: some View {
        HStack {
            Button {
                if let url = URL(string: urlString) {
                    openURL(url)
                }
            } label: {
                HStack {
                    SettingIconView(
                        icon: .system(
                            icon: icon,
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor
                        )
                    )
                    Text(title)
                }
            }
            .foregroundStyle(.primary)
        }
    }

    // MARK: Private

    private let title: LocalizedStringKey
    private let icon: String
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let urlString: String

    @Environment(\.openURL) private var openURL
}

#Preview {
    List {
        SettingsOpenURLButton(
            title: "给我们好评",
            icon: "star.fill",
            foregroundColor: .white,
            backgroundColor: .pink,
            urlString: "itms-apps://itunes.apple.com/app/id6504145207?action=write-review"
        )
    }
}
