//
//  View+onAppearOnce.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/19.
//
import SwiftUI

@MainActor
public extension View {
    func onAppearOnce(perform action: @escaping () -> Void) -> some View {
        withInlineState(initialValue: false) { $didAppear in
            self.onAppear {
                guard !didAppear else {
                    return
                }

                action()

                didAppear = true
            }
        }
    }
}

@MainActor
public func withInlineState<Value>(
    initialValue: Value,
    @ViewBuilder content: @escaping (Binding<Value>) -> some View
) -> some View {
    WithInlineState(initialValue: initialValue, content: content)
}

private struct WithInlineState<Value, Content: View>: View {
    @State var value: Value

    let content: (Binding<Value>) -> Content

    init(
        initialValue: Value,
        @ViewBuilder content: @escaping (Binding<Value>) -> Content
    ) {
        _value = .init(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
