import SwiftUI

public struct LemonEditButton: View {
    // MARK: Lifecycle

    public init(
        editMode: Binding<EditMode>,
        title1: LocalizedStringKey,
        title2: LocalizedStringKey
    ) {
        _editMode = editMode
        self.title1 = title1
        self.title2 = title2
    }

    // MARK: Public

    public var body: some View {
        Button {
            withAnimation {
                editMode.toggle()
            }
        } label: {
            Text(editMode.isEditing ? title1 : title2)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(editMode.isEditing ? .accentColor : .clear)
                .clipShape(Capsule())
                .foregroundStyle(
                    editMode.isEditing ? Color(.systemBackground) : Color.accentColor
                )
                .animation(nil, value: editMode)
        }
    }

    // MARK: Internal

    @Binding var editMode: EditMode
    let title1: LocalizedStringKey
    let title2: LocalizedStringKey
}

#Preview {
    LemonEditButton(editMode: .constant(.active), title1: "Done", title2: "排序")

    LemonEditButton(editMode: .constant(.inactive), title1: "Done", title2: "排序")
}
