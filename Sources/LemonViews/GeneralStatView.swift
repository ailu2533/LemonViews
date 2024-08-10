//
//  SwiftUIView.swift
//  LemonViews
//
//  Created by ailu on 2024/8/10.
//

import SwiftUI

public struct GeneralStatView<Item: Identifiable, Content: View>: View {
    private let data: [Item]
    private let content: (Item) -> Content

    public init(data: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.data = data
        self.content = content
    }

    public var body: some View {
        List(data) { item in
            content(item)
        }
    }
}

public struct GeneralRowView<Item: Identifiable, Content: View>: View {
    @State private var stats: Stats?

    private let item: Item
    private let content: (Item) -> Content
    private let loadStats: () async -> Stats

    public init(item: Item, @ViewBuilder content: @escaping (Item) -> Content, loadStats: @escaping () async -> Stats) {
        self.item = item
        self.content = content
        self.loadStats = loadStats
    }

    public var body: some View {
        HStack {
            content(item)
            Spacer()
            if let stats = stats {
                StatsItemView(stats: stats)
            } else {
                ProgressView()
            }
        }
        .padding(.vertical, 8)
        .task {
            stats = await loadStats()
        }
    }
}