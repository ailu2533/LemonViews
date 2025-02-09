import SFSafeSymbols
import SwiftUI

public struct SettingsRawLabelView: View {
    // MARK: Lifecycle

    public init(
        systemName: SFSymbol,
        text: String,
        foregroundColor: Color = .white,
        backgroundColor: Color
    ) {
        self.systemName = systemName
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    // MARK: Public

    public var body: some View {
        HStack {
            SettingIconView(
                icon: .system(
                    icon: systemName,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor
                )
            )

            Text(text)
                .padding(.leading, 5)
        }
    }

    // MARK: Internal

    let systemName: SFSymbol
    let text: String
    let foregroundColor: Color
    let backgroundColor: Color
}
