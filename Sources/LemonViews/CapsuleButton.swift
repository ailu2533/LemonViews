//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/7/17.
//

import SwiftUI

// 自定义胶囊按钮样式
public struct CapsuleButtonStyle: ButtonStyle {
    let isSelected: Bool
    let tagColor: Color
    let textColor: Color

    public init(isSelected: Bool = false, textColor: Color, tagColor: Color = Color(.systemGray5)) {
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.textColor = textColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isSelected ? tagColor : Color(.systemGray6))
            .foregroundColor(textColor)
            .clipShape(Capsule())
            .font(.subheadline)
            .shadow(radius: 0.4)
    }
}

// 自定义胶囊按钮样式
public struct CapsuleButtonStyle2: ButtonStyle {
    let isSelected: Bool
    let tagColor: Color
    let textColor: Color

    public init(isSelected: Bool = false, textColor: Color, tagColor: Color = Color(.systemGray5)) {
        self.isSelected = isSelected
        self.tagColor = tagColor
        self.textColor = textColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isSelected ? tagColor : Color(.systemGray6))
            .foregroundColor(textColor)
            .clipShape(Capsule())
//            .font(.subheadline)
//            .fontWeight(.semibold)
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
        .buttonStyle(CapsuleButtonStyle(isSelected: isSelected, textColor: .primary, tagColor: tagColor))
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
        .buttonStyle(CapsuleButtonStyle(isSelected: isSelected, textColor: .primary, tagColor: tagColor))
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

public struct ColorButton: View {
    let color: Color
    let isSelected: Bool

    public init(color: Color, isSelected: Bool) {
        self.color = color
        self.isSelected = isSelected
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(color)
            .frame(width: 30, height: 30)
            .shadow(radius: 1)
            .scaleEffect(isSelected ? 0.7 : 1, anchor: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
            )
    }
}
