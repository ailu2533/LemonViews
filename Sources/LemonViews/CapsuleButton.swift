//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/7/17.
//

import SwiftUI

// 自定义胶囊按钮样式
struct CapsuleButtonStyle: ButtonStyle {
    let isSelected: Bool
    let tagColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isSelected ? tagColor : Color(.systemGray6))
            .foregroundColor(Color(.textBlack))
            .clipShape(Capsule())
            .font(.subheadline)
            .shadow(radius: 0.4)
    }
}

// 单个标签值按钮视图
public struct CapsuleButton: View {
    let title: String
    let isSelected: Bool
    let tagColor: Color
    let action: () -> Void

    public init(title: String, isSelected: Bool, tagColor: Color, action: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .frame(minWidth: 20)
        }
        .buttonStyle(CapsuleButtonStyle(isSelected: isSelected, tagColor: tagColor))
    }
}

// 单个标签值按钮视图
public struct CapsuleButton2<Content: View>: View {
//    let title: String
    let isSelected: Bool
    let tagColor: Color
    let action: () -> Void
    let content: () -> Content

    public init(isSelected: Bool, tagColor: Color, action: @escaping () -> Void, content: @escaping () -> Content) {
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.action = action
        self.content = content
    }

    public var body: some View {
        Button(action: action) {
            content()
        }
        .buttonStyle(CapsuleButtonStyle(isSelected: isSelected, tagColor: tagColor))
    }
}

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
