//
//  SaveButton.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/14.
//
import os
import SwiftUI

public struct SaveButton: ToolbarContent {
    // MARK: Lifecycle

    /// 创建一个保存按钮
    /// - Parameters:
    ///   - disabled: 是否禁用按钮
    ///   - dismissAfterSave: 保存成功后是否自动关闭，默认为 true
    ///   - onSave: 保存操作，如果抛出错误则不会关闭视图
    ///   - onError: 可选的错误处理回调，如果不提供则只打印错误
    public init(
        disabled: Bool = false,
        dismissAfterSave: Bool = true,
        onSave: @escaping () async throws -> Void,
        onError: ((Error) -> Void)? = nil
    ) {
        self.disabled = disabled
        self.dismissAfterSave = dismissAfterSave
        self.onSave = onSave
        self.onError = onError
    }

    // MARK: Public

    public var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button {
                Task {
                    guard saveState == .idle else { return }

                    saveState = .saving

                    do {
                        try await onSave()

                        if dismissAfterSave {
                            dismiss()
                        }
                    } catch {
                        // 保存失败，调用错误回调或记录错误
                        if let onError {
                            onError(error)
                        } else {
                            logger.error("保存失败: \(error.localizedDescription)")
                        }
                    }

                    saveState = .idle
                }
            } label: {
                Text(saveState.text, bundle: .module)
            }
            .buttonStyle(.borderedProminent)
            .disabled(disabled || saveState == .saving)
        }
    }

    // MARK: Private

    private let disabled: Bool
    private let dismissAfterSave: Bool
    private let onSave: () async throws -> Void
    private let onError: ((Error) -> Void)?

    private let logger = Logger(subsystem: "LemonViews", category: "SaveButton")

    @Environment(\.dismiss)
    private var dismiss

    @State private var saveState: SaveState = .idle
}

// MARK: - SaveState

public enum SaveState {
    case idle
    case saving

    var text: LocalizedStringKey {
        switch self {
        case .idle:
            "Save"

        case .saving:
            "Saving"
        }
    }
}
