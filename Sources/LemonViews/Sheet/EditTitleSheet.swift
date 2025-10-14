import SwiftUI

public struct EditTitleSheet: View {
    // MARK: Lifecycle
    
    /// 创建标题编辑视图
    /// - Parameters:
    ///   - navigationTitle: 导航栏标题
    ///   - title: 初始标题
    ///   - updateAction: 更新回调
    public init(
        navigationTitle: LocalizedStringKey,
        title: String,
        updateAction: @escaping (String) async throws -> Void
    ) {
        self.navigationTitle = navigationTitle
        self.updateAction = updateAction
        self.originalTitle = title
        _title = State(initialValue: title)
    }

    // MARK: Public

    public var body: some View {
        NavigationStack {
            Form {
                FormTitleView(
                    title: "Title",
                    text: $title,
                    initialFocusState: true
                )
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    CancelButton()
                }

                SaveButton(
                    disabled: isSaveDisabled,
                    onSave: {
                        try await updateAction(title.trimmingCharacters(in: .whitespacesAndNewlines))
                    }
                )
            }
        }
    }

    // MARK: Private

    private let navigationTitle: LocalizedStringKey
    private let updateAction: (String) async throws -> Void
    private let originalTitle: String
    
    @State private var title: String
    @Environment(\.dismiss) private var dismiss
    
    private var isSaveDisabled: Bool {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 标题为空或未改变
        return trimmedTitle.isEmpty || trimmedTitle == originalTitle
    }
}
