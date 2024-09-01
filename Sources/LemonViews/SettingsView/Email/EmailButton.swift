//
//  File.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SwiftUI

public struct EmailButton: View {
    @Environment(\.openURL) private var openURL
    private let emailAddress: String
    let foregroundColor: Color
    let backgroundColor: Color

    public init(emailAddress: String = "im.ailu@outlook.com", foregroundColor: Color, backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.emailAddress = emailAddress
    }

    public var body: some View {
        Button(action: {
            let subject = "Support email from app user"
            let email = SupportEmail(toAddress: emailAddress, subject: subject)
            email.send(openURL: openURL)
        }, label: {
            HStack {
                SettingIconView(icon: .system(icon: "mail", foregroundColor: foregroundColor, backgroundColor: backgroundColor))

                HStack {
                    Text("邮箱")
                    Text(verbatim: emailAddress)
                }

                Spacer()

                SettingIconView(icon: .system(icon: "arrowshape.turn.up.right.fill", foregroundColor: .gray, backgroundColor: .clear))
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    EmailButton(emailAddress: "example@example.com", foregroundColor: .white, backgroundColor: .blue)
}
