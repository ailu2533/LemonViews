//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/7/17.
//

import SwiftUI

// 预览提供器
#Preview {
    VStack {
        CapsuleButton(
            title: "测试", // 使用模拟数据
            isSelected: false,
            tagColor: .blue,
            action: {}
        )
        CapsuleButton(
            title: "测试", // 使用模拟数据
            isSelected: true,
            tagColor: .blue.opacity(0.4),
            action: {}
        )

        CapsuleButton(
            title: "M", // 使用模拟数据
            isSelected: true,
            tagColor: .blue.opacity(0.4),
            action: {}
        )
    }
}

// MARK: - CapsuleButton

public struct CapsuleButton<Content: View>: View {
    // MARK: Lifecycle

    // String 初始化器
    public init(
        @ViewBuilder title: @escaping () -> Content,
        isSelected: Bool,
        tagColor: Color,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.action = action
    }

    // MARK: Public

    public var body: some View {
        Button(action: action) {
            title()
                .frame(minWidth: 20)
        }
        .buttonStyle(
            CapsuleButtonStyle(
                isSelected: isSelected,
                textColor: .primary,
                tagColor: tagColor
            )
        )
    }

    // MARK: Internal

    let isSelected: Bool
    let tagColor: Color
    let action: () -> Void

    // MARK: Private

    private let title: () -> Content // 使用 Text 视图来处理不同类型的输入
}

extension CapsuleButton where Content == Text {
    // 字符串便利初始化器
    public init(
        title: String,
        isSelected: Bool,
        tagColor: Color,
        action: @escaping () -> Void
    ) {
        self.init(
            title: { Text(title) },
            isSelected: isSelected,
            tagColor: tagColor,
            action: action
        )
    }

    // LocalizedStringKey 便利初始化器
    public init(
        title: LocalizedStringKey,
        isSelected: Bool,
        tagColor: Color,
        action: @escaping () -> Void
    ) {
        self.init(
            title: { Text(title) },
            isSelected: isSelected,
            tagColor: tagColor,
            action: action
        )
    }
}
