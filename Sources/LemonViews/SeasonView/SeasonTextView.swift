//
//  SeasonTextView.swift
//  LemonThingsManager
//
//  Created by ailu on 2024/7/14.
//

import SwiftUI

struct SeasonTextView: View {
    var season: Int

    var body: some View {
        if season == 0 || season == 15 {
            seasonTag("四季", color: .purple)
        } else {
            HStack(spacing: 4) {
                if season & 1 > 0 {
                    seasonTag("春", color: .green)
                }
                if season & 2 > 0 {
                    seasonTag("夏", color: .red)
                }
                if season & 4 > 0 {
                    seasonTag("秋", color: .orange)
                }
                if season & 8 > 0 {
                    seasonTag("冬", color: .blue)
                }
            }
        }
    }

    func seasonTag(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
}

//#Preview {
//    VStack(spacing: 10) {
//        SeasonTextView(season: 15)
//        SeasonTextView(season: 7)
//        SeasonTextView(season: 3)
//        SeasonTextView(season: 8)
//    }
//}
