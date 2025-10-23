//
//  LemonScrollView.swift
//
//
//  Created by Lu Ai on 2024/9/15.
//

import SwiftUI

public struct LemonScrollView<Content: View>: View {
    let verticalMargin: CGFloat
    let horizontalPadding: CGFloat

    var content: () -> Content

    public init(verticalMargin: CGFloat = 20, horizontalPadding: CGFloat = 16, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.verticalMargin = verticalMargin
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        ScrollView {
            content()
                .padding(.horizontal, horizontalPadding)
        }
        .contentMargins(.vertical, verticalMargin)
        .scrollIndicators(.hidden)
    }
}
