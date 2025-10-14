//
//  CancelButton.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/14.
//

import SwiftUI

public struct CancelButton: View {
    // MARK: Internal

    public var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Cancel")
        }
    }

    // MARK: Private

    @Environment(\.dismiss)
    private var dismiss

    public init() {}
}
