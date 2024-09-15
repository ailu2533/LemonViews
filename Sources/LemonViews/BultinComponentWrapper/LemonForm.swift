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
