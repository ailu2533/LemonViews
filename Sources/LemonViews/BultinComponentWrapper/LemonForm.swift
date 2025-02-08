//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/9/15.
//

import SFSafeSymbols
import SwiftUI

// MARK: - LemonForm

public struct LemonForm<Content: View>: View {
    // MARK: Lifecycle

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    // MARK: Public

    public var body: some View {
        Form {
            content()
        }
        .scrollContentBackground(.hidden)
        .contentMargins(.vertical, 2)
    }

    // MARK: Internal

    @ViewBuilder
    let content: () -> Content
}

#Preview {
    LemonForm {
        Text("hello")
    }
}

// MARK: - FormTitleView

public struct FormTitleView: View {
    // MARK: Lifecycle

    public init(
        title: LocalizedStringKey,
        text: Binding<String>,
        initialFocusState: Bool? = nil
    ) {
        self.title = title
        _text = text
        self.initialFocusState = initialFocusState
    }

    // MARK: Public

    public var body: some View {
        HStack {
            FormIconView(systemSymbol: .docPlaintextFill, size: 16)
                .padding(.leading, 16)
            TextField(title, text: $text)
                .listRowInsets(EdgeInsets())
                .submitLabel(.done)
                .focused($isFocused)
        }
        .padding(.vertical, 8)
        .clipShape(RoundedRectangle(cornerRadius: 12))

        .listRowInsets(EdgeInsets())
        .onAppearOnce {
            if let initialFocusState {
                isFocused = initialFocusState
                return
            }

            if text.isEmpty {
                isFocused = true
            }
        }
    }

    // MARK: Internal

    let title: LocalizedStringKey
    @Binding var text: String
    let initialFocusState: Bool?

    // MARK: Private

    @FocusState private var isFocused
}

#Preview {
    Form {
        FormTitleView(title: "please input a habit name", text: .constant("running"))
    }
}

// MARK: - FormIconView

public struct FormIconView: View {
    // MARK: Lifecycle

    public init(systemSymbol: SFSymbol, size: CGFloat) {
        self.systemSymbol = systemSymbol
        self.size = size
    }

    // MARK: Public

    public var body: some View {
        Image(systemSymbol: systemSymbol)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }

    // MARK: Internal

    let systemSymbol: SFSymbol
    var size: CGFloat = 28
}
