import SwiftUI

// MARK: - TagToggleStyle

/// A custom toggle style that resembles iOS system tag appearance
public struct TagToggleStyle: ToggleStyle {
    // MARK: Internal

    public init() {}

    /// Creates a tag-style toggle with system-standard appearance
    /// - Parameter configuration: The toggle configuration
    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .font(.callout)
                .padding(.horizontal, Layout.horizontalPadding)
                .padding(.vertical, Layout.verticalPadding)
                .frame(minWidth: Layout.minWidth)
                .background(configuration.isOn ? Colors.selected : Colors.normal)
                .foregroundStyle(configuration.isOn ? Colors.selectedText : Colors.normalText)
                .clipShape(RoundedRectangle(cornerRadius: Layout.cornerRadius))
        }
        .buttonStyle(.plain)
    }

    // MARK: Private

    private enum Colors {
        /// Background color for selected state
        static let selected = Color.accentColor
        /// Background color for normal state
        static let normal = Color(uiColor: .systemGray6)
        /// Text color for selected state
        static let selectedText = Color(uiColor: .systemBackground)
        /// Text color for normal state
        static let normalText = Color(uiColor: .label)
    }

    private enum Layout {
        /// Horizontal padding for the tag
        static let horizontalPadding: CGFloat = 8
        /// Vertical padding for the tag
        static let verticalPadding: CGFloat = 6
        /// Minimum width for the tag
        static let minWidth: CGFloat = 44 // Apple's minimum tappable size
        /// Corner radius for the tag
        static let cornerRadius: CGFloat = 12
    }
}
