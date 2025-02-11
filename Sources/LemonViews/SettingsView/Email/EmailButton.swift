//
//  File.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SwiftUI

public struct EmailButton: View {
    // MARK: Lifecycle

    public init(
        title: LocalizedStringKey,
        emailAddress: String = "im.ailu@outlook.com",
        foregroundColor: Color,
        backgroundColor: Color
    ) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.emailAddress = emailAddress
    }

    // MARK: Public

    public var body: some View {
        Button(
            action: {
                let subject = "Support email from app user"
                let email = SupportEmail(toAddress: emailAddress, subject: subject)
                email.send(openURL: openURL)
            },
            label: {
                SettingsRawLabelView(
                    systemName: .mail,
                    text: emailAddress,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor
                )
            }
        )
        .tint(.primary)
    }

    // MARK: Internal

    let title: LocalizedStringKey
    let foregroundColor: Color
    let backgroundColor: Color

    // MARK: Private

    @Environment(\.openURL)
    private var openURL
    private let emailAddress: String
}

#Preview {
    EmailButton(
        title: "邮箱",
        emailAddress: "example@example.com",
        foregroundColor: .white,
        backgroundColor: .blue
    )
}
