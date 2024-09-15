//
//  SwiftUIView.swift
//
//
//  Created by Lu Ai on 2024/9/15.
//

import SwiftUI

public struct LemonScrollView<Content: View>: View {
    @ViewBuilder
    var content: () -> Content

    public var body: some View {
        ScrollView {
            content()
        }
        .contentMargins(.bottom, 20)
        .contentMargins(16, for: .scrollContent)
        .scrollIndicators(.hidden)
    }
}
