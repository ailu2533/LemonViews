//
//  SettingsIconView.swift
//  LittleDecision
//
//  Created by Lu Ai on 2024/8/31.
//

import SwiftUI

public enum SettingIcon {
    case system(icon: String, foregroundColor: Color = .white, backgroundColor: Color)

    /// Pass in a `foregroundColor` to render and recolor the image as a template.
    case image(name: String, inset: CGFloat, foregroundColor: Color?, backgroundColor: Color)
    case custom(view: AnyView)
}

/**
 A view for displaying a `SettingIcon`.
 */
public struct SettingIconView: View {
    public var icon: SettingIcon

    public init(icon: SettingIcon) {
        self.icon = icon
    }

    public var body: some View {
        switch icon {
        case let .system(icon, foregroundColor, backgroundColor):
            Image(systemName: icon)
                .foregroundColor(foregroundColor)
                .font(.footnote)
                .frame(width: 28, height: 28)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 6))

        case let .image(name, inset, foregroundColor, backgroundColor):
            if let foregroundColor {
                Image(name)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(foregroundColor)
                    .aspectRatio(contentMode: .fit)
                    .padding(inset)
                    .frame(width: 28, height: 28)
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))

            } else {
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(inset)
                    .frame(width: 28, height: 28)
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            }

        case let .custom(anyView):
            anyView
        }
    }
}
