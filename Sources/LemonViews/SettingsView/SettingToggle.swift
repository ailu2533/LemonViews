//
//  File.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SwiftUI

struct SettingToggle: View {
    @Binding var isOn: Bool

    let icon: String
    let foregroundColor: Color
    let backgroundColor: Color

    let title: String
    let description: String?

    var body: some View {
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
