import SwiftUI

public struct ChecklistToggleStyle: ToggleStyle {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemSymbol: configuration.isOn ? .checkmarkSquareFill : .square)
                    .fontWeight(.semibold)
                configuration.label
                    .tint(.primary)
            }
        }
    }
}
