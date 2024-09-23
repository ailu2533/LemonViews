//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/9/15.
//

import SwiftUI

public struct LemonForm<Content: View>: View {
    @ViewBuilder
    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        Form {
            content()
        }
        .scrollContentBackground(.hidden)
        .contentMargins(.vertical, 2)
    }
}

#Preview {
    LemonForm {
        Text("hello")
    }
}

public struct FormTitleView: View {
    let title: LocalizedStringKey
    @Binding var text: String
    @FocusState private var isFocused

    public init(title: LocalizedStringKey, text: Binding<String>) {
        self.title = title
        _text = text
    }

    public var body: some View {
        HStack {
            FormIconView(systemName: "doc.plaintext.fill", size: 16)
                .padding(.leading, 16)
            TextField(title, text: $text)
                .listRowInsets(EdgeInsets())
                .submitLabel(.done)
                .focused($isFocused)
        }
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))

        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
        .onAppearOnce {
            if text.isEmpty {
                isFocused = true
            }
        }
    }
}

#Preview {
    Form {
        FormTitleView(title: "please input a habit name", text: .constant("running"))
    }
}

public struct FormIconView: View {
    let systemName: String
    var size: CGFloat = 28

    public init(systemName: String, size: CGFloat) {
        self.systemName = systemName
        self.size = size
    }

    public var body: some View {
        Image(systemName: systemName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Color(.netureBlack))
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
}
