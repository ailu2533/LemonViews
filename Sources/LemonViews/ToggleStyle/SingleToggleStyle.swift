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
                    .contentTransition(.symbolEffect(.replace)) // 图标切换动画
                    .animation(.snappy(duration: 0.1), value: configuration.isOn) // 状态变化动画

                configuration.label
                    .tint(.primary)
            }
        }
        .sensoryFeedback(.selection, trigger: configuration.isOn)
    }
}
