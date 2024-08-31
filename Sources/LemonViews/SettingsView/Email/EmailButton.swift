//
//  File.swift
//
//
//  Created by Lu Ai on 2024/8/31.
//

import Foundation
import SwiftUI

struct EmailButton: View {
    @Environment(\.openURL) var openURL
    let emailAddress = "im.ailu@outlook.com"
    let backgroundColor: Color

    var body: some View {
        Button(action: {
            let subject = "Support email from app user"
            let email = SupportEmail(toAddress: emailAddress, subject: subject)
            email.send(openURL: openURL)
        }, label: {
            HStack {
                SettingIconView(icon: .system(icon: "mail", foregroundColor: .white, backgroundColor: backgroundColor))

                Text("邮箱 \(emailAddress)")
            }
        })
    }
}
