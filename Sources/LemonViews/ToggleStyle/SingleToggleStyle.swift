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
                Image(systemSymbol: configuration.isOn ? .checkmarkCircleFill : .circle)
                    .fontWeight(.semibold)

                configuration.label
                    .tint(.primary)
            }
        }
        .sensoryFeedback(.selection, trigger: configuration.isOn)
    }
}
