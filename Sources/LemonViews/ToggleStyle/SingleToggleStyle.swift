import SwiftUI

public struct SingleToggleStyle: ToggleStyle {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
                    .tint(.primary)

                Spacer()
                Image(systemSymbol: configuration.isOn ? .checkmarkCircleFill : .circle)
                    .imageScale(.large)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(.borderless)
    }
}
