import SwiftUI

// MARK: - Label Extension

public extension View {
    @MainActor func settingsStyle(
        _ backgroundColor: Color = .purple
    ) -> some View {
        labelStyle(
            SettingsLabelStyle(
                foregroundColor: .white,
                backgroundColor: backgroundColor
            )
        )
    }

    @MainActor func formLabelStyle(
        _: Color = .purple
    ) -> some View {
        labelStyle(FormLabelStyle())
    }
}

public struct FormLabelStyle: LabelStyle {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(.secondary)
                .font(.footnote)
                .frame(width: 28, height: 28)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 6))

            configuration.title
        }
    }
}
