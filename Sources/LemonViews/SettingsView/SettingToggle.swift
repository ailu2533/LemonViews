//
//  File.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SwiftUI

public struct SettingToggle: View {
    @Binding var isOn: Bool

    let icon: String
    let foregroundColor: Color
    let backgroundColor: Color

    let title: String
    let description: String?

    public init(isOn: Binding<Bool>, icon: String, foregroundColor: Color, backgroundColor: Color, title: String, description: String?) {
        _isOn = isOn
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.title = title
        self.description = description
    }

    public var body: some View {
        HStack {
            SettingIconView(icon: .system(icon: icon, foregroundColor: foregroundColor, backgroundColor: backgroundColor))

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
}
