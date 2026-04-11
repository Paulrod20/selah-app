//
//  PillTabBar.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI

struct PillTabBar: View {
    @Binding var selectedTab: Tab
    @Namespace private var tabAnimation

    var body: some View {
        HStack(spacing: 0) {
            ForEach([Tab.journal, Tab.bible, Tab.stats], id: \.self) { tab in
                tabButton(for: tab)
            }
        }
        .padding(4)
        .background(.ultraThinMaterial, in: Capsule())
    }

    private func tabButton(for tab: Tab) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        } label: {
            Text(tab.label)
                .font(.subheadline)
                .fontWeight(selectedTab == tab ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background {
                    if selectedTab == tab {
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .matchedGeometryEffect(id: "pill", in: tabAnimation)
                    }
                }
                .foregroundStyle(selectedTab == tab ? .primary : .secondary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PillTabBar(selectedTab: .constant(.journal))
}
