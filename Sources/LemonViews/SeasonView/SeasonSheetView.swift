//
//  SeasonSheetView.swift
//  LemonThingsManager
//
//  Created by ailu on 2024/7/14.
//

import Foundation
import SwiftUI
import SwiftUIX

extension Int {
    mutating func toggleBit(_ bit: Int) {
        self ^= bit
    }
}

public struct SeasonSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSeason: Int

    private let onComplete: (Int) -> Void

    public init(initialSelection: Int, onComplete: @escaping (Int) -> Void) {
        _selectedSeason = State(initialValue: initialSelection)
        self.onComplete = onComplete
    }

    public var body: some View {
        NavigationStack {
            List(Season.seasons) { season in
                SeasonRow(season: season, isSelected: isSeasonSelected(season.bitmask)) {
                    selectedSeason.toggleBit(season.bitmask)
                }
            }
            .listRowSeparator(.hidden)
            .navigationTitle("季节")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("完成") {
                        onComplete(selectedSeason)
                        dismiss()
                    }
                }
            }
        }
    }

    private func isSeasonSelected(_ bitmask: Int) -> Bool {
        selectedSeason & bitmask != 0
    }
}

private struct SeasonRow: View {
    let season: Season
    let isSelected: Bool
    let onToggle: () -> Void

    var body: some View {
        CheckBoxRowWithContent(isChecked: isSelected, content: {
            Image(systemName: season.symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(season.color)
            Text(season.name)
        }, callback: onToggle)
    }
}

#Preview {
    SeasonSheetView(initialSelection: 15) { newSeason in
        print(newSeason)
    }
}
