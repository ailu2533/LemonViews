//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

public struct CurrencyText: View {
    let value: Double

    public init(value: Double) {
        self.value = value
    }

    public var body: some View {
        let decimalValue = Decimal(value)
        Text(decimalValue, format: .currency(code: "CNY").precision(.fractionLength(2)))
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    CurrencyText(value: 12.345)
}
