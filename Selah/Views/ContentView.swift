//
//  ContentView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var entries: [JournalEntry]
    @Environment(\.modelContext) private var modelContext
    @State private var selectedEntry: JournalEntry?
    @State private var selectedTab: Tab = .journal
    
    var body: some View {
        NavigationSplitView {
            //Sidebar changes based on active tab
            switch selectedTab {
            case .journal:
                SidebarView(entries: entries, selection: $selectedEntry)
            case .bible:
                Text("Bible Sidebar")
            case .stats:
                EmptyView()
            }
        } detail: {
            ZStack(alignment: .bottom) {
                // Main content area
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Pill tab bar floating at the bottom
                PillTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
