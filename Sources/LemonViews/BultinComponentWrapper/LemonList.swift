//
//  SwiftUIView 2.swift
//
//
//  Created by Lu Ai on 2024/9/15.
//

import SwiftUI

public struct LemonList<Content: View>: View {
    @ViewBuilder
    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        List {
            content()
        }
        .contentMargins(.vertical, 2)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    LemonList {
        Button(action: {}, label: {
            Text("add new tag")
        })
        .buttonStyle(FullWidthButtonStyle(verticalPadding: 10))
        .listRowInsets(EdgeInsets())
    }
}
