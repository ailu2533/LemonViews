//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

struct CurrencyText: View {
    let value: Double
    var body: some View {
        let decimalValue = Decimal(value)
        Text(decimalValue, format: .currency(code: "CNY").precision(.fractionLength(2)))
    }
}

#Preview {
    CurrencyText(value: 12.345)
}
