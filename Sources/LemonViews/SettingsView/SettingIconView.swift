//
//  SettingIconView.swift
//  LittleDecision
//
//  Created by Lu Ai on 2024/8/31.
//

import SFSafeSymbols
import SwiftUI

// MARK: - SettingIcon

public enum SettingIcon {
    case system(icon: SFSymbol, foregroundColor: Color = .white, backgroundColor: Color)

    /// Pass in a `foregroundColor` to render and recolor the image as a template.
    case image(name: String, inset: CGFloat, foregroundColor: Color?, backgroundColor: Color)
    case custom(view: AnyView)
}

// MARK: - SettingIconView

/**
 A view for displaying a `SettingIcon`.
 */
public struct SettingIconView: View {
    // MARK: Lifecycle

    public init(icon: SettingIcon) {
        self.icon = icon
    }

    // MARK: Public

    public var icon: SettingIcon

    public var body: some View {
        switch icon {
        case let .system(icon, foregroundColor, backgroundColor):
            Image(systemSymbol: icon)
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
