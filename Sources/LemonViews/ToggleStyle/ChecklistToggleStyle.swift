import SwiftUI

public struct ChecklistToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
                    .tint(.primary)

                Spacer()
                Image(systemSymbol: configuration.isOn ? .checkmarkSquareFill : .square)
                    .imageScale(.large)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(.borderless)
    }
}
