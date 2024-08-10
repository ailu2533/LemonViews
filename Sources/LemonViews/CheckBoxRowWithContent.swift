//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

public struct CheckBoxRowWithContent<Content: View>: View {
    public let isChecked: Bool
    @ViewBuilder
    public let content: () -> Content
    public let callback: () -> Void

    public init(isChecked: Bool, @ViewBuilder content: @escaping () -> Content, callback: @escaping () -> Void) {
        self.isChecked = isChecked
        self.content = content
        self.callback = callback
    }

    public var body: some View {
        Button {
            callback()
        } label: {
            HStack {
                content()

                Spacer()
                Image(systemName: isChecked ?
                    "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(.cyan)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CheckBoxRowWithContent(isChecked: true) {
        Text("test")
    } callback: {
    }
}
