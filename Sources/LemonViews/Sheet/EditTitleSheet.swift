import SwiftUI

public struct EditTitleSheet: View {
    let navigationTitle: LocalizedStringKey
    let updateAction: (String) -> Void

    @State private var title: String
    @Environment(\.dismiss) private var dismiss

    public init(navigationTitle: LocalizedStringKey, title: String, updateAction: @escaping (String) -> Void) {
        self.navigationTitle = navigationTitle
        self.updateAction = updateAction
        _title = State(initialValue: title)
    }

    public var body: some View {
        NavigationStack {
            Form {
                FormTitleView(title: "Title", text: $title, initialFocusState: true)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    CancelButton()
                }

                SaveButton {
                    updateAction(title)
                }
            }
        }
    }
}
