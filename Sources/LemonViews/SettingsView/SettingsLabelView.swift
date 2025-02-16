//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SFSafeSymbols
import SwiftUI

// MARK: - SettingsLabelView

public struct SettingsLabelView: View {
    // MARK: Lifecycle

    public init(
        systemName: SFSymbol,
        text: LocalizedStringKey,
        foregroundColor: Color = .white,
        backgroundColor: Color
    ) {
        self.systemName = systemName
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    // MARK: Public

    public var body: some View {
        HStack {
            SettingIconView(
                icon: .system(
                    icon: systemName,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor
                )
            )

            Text(text)
                .padding(.leading, 5)
        }
    }

    // MARK: Internal

    let systemName: SFSymbol
    let text: LocalizedStringKey
    let foregroundColor: Color
    let backgroundColor: Color
}

#Preview {
    Form {
        SettingsLabelView(
            systemName: .tshirtFill,
            text: "衣服",
            backgroundColor: .blue
        )

        Label {
            Text("衣服")
        } icon: {
            Image(systemSymbol: .tshirtFill)
        }
        .labelStyle(SettingsLabelStyle())
    }
}

// MARK: - SettingsLabelStyle

public struct SettingsLabelStyle: LabelStyle {
    // MARK: Lifecycle

    public init(foregroundColor: Color = .white, backgroundColor: Color = .blue) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(foregroundColor)
                .font(.footnote)
                .frame(width: 28, height: 28)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))

            configuration.title
        }
    }

    // MARK: Private

    private var foregroundColor: Color
    private var backgroundColor: Color
}
