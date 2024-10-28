//
//  CapsuleButton2.swift
//  LemonViews
//
//  Created by Lu Ai on 2024/10/28.
//

import SwiftUI

// 单个标签值按钮视图
public struct CapsuleButton2<Content: View>: View {
    // MARK: Lifecycle

    public init(isSelected: Bool, tagColor: Color, action: @escaping () -> Void, content: @escaping () -> Content) {
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.action = action
        self.content = content
    }

    // MARK: Public

    public var body: some View {
        Button(action: action) {
            content()
        }
        .buttonStyle(CapsuleButtonStyle(isSelected: isSelected, textColor: .primary, tagColor: tagColor))
    }

    // MARK: Internal

//    let title: String
    let isSelected: Bool
    let tagColor: Color
    let action: () -> Void
    let content: () -> Content
}
