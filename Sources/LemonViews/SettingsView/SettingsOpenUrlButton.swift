//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/8/13.
//

import SwiftUI

public struct SettingsOpenUrlButton: View {
    private let title: String
    private let icon: String
    private let iconBackground: Color
    private let urlString: String
    @Environment(\.openURL) private var openURL

    public init(title: String, icon: String, iconBackground: Color = .blue, urlString: String) {
        self.title = title
        self.icon = icon
        self.iconBackground = iconBackground
        self.urlString = urlString
    }

    public var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(iconBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            Button(title) {
                if let url = URL(string: urlString) {
                    openURL(url)
                }
            }
        }
    }
}

#Preview {
    List {
        SettingsOpenUrlButton(title: "给我们好评", icon: "star", urlString: "itms-apps://itunes.apple.com/app/id6504145207?action=write-review")
    }
}
