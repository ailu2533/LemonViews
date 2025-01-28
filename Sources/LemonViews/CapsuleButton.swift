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

// MARK: - CapsuleToggleStyle

public struct CapsuleToggleStyle: ToggleStyle {
    // MARK: Lifecycle

    public init(
        activeColor: Color = .blue,
        inactiveColor: Color = Color(.systemGray5),
        activeTextColor: Color = .white,
        inactiveTextColor: Color = .primary
    ) {
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        self.activeTextColor = activeTextColor
        self.inactiveTextColor = inactiveTextColor
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(
                        configuration.isOn ? activeColor : inactiveColor
                    )
            )
            .foregroundColor(
                configuration.isOn ? activeTextColor : inactiveTextColor
            )
            .contentShape(Capsule())
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }

    // MARK: Internal

    // MARK: Properties

    var activeColor: Color
    var inactiveColor: Color
    var activeTextColor: Color
    var inactiveTextColor: Color

    // MARK: Private

    // MARK: Animation

    private let animation: Animation = .easeInOut(duration: 0.2)
}

// MARK: - Convenience Extensions

extension CapsuleToggleStyle {
    public static let `default` = CapsuleToggleStyle()

    public static let accent = CapsuleToggleStyle(
        activeColor: .accentColor,
        inactiveColor: Color(.systemGray6)
    )

    public static let destructive = CapsuleToggleStyle(
        activeColor: .red,
        inactiveColor: Color(.systemGray6)
    )
}

#Preview {
    ToggleTest()
}

// MARK: - ToggleTest

struct ToggleTest: View {
    // MARK: Internal

    var body: some View {
        Toggle(isOn: $isOn) {
            Text("test")
        }
        .toggleStyle(CapsuleToggleStyle.accent)
    }

    // MARK: Private

    @State private var isOn = true
}
