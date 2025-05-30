//
//  SettingToggle.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SFSafeSymbols
import SwiftUI

public struct SettingToggle: View {
    // MARK: Lifecycle

    public init(
        isOn: Binding<Bool>,
        icon: SFSymbol,
        foregroundColor: Color,
        backgroundColor: Color,
        title: LocalizedStringKey,
        description: LocalizedStringKey?
    ) {
        _isOn = isOn
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.title = title
        self.description = description
    }

    // MARK: Public

    public var body: some View {
        HStack {
            SettingIconView(
                icon: .system(
                    icon: icon,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor
                )
            )

            Toggle(isOn: $isOn) {
                VStack(alignment: .leading) {
                    Text(title)
                    if let description {
                        Text(description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // MARK: Internal

    @Binding var isOn: Bool

    let icon: SFSymbol
    let foregroundColor: Color
    let backgroundColor: Color

    let title: LocalizedStringKey
    let description: LocalizedStringKey?
}
