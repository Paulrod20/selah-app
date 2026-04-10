//
//  ContentView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // @Query is like useSelector or a data hook — it automatically
    // re-renders this view whenever the data changes
    @Query private var entries: [JournalEntry]
    
    // This is SwiftUI's way of saying "give me access to the
    // shared database context" — like a React context for your DB
    @Environment(\.modelContext) private var modelContext
    
    // @State is like useState — local to this view
    @State private var selectedEntry: JournalEntry?

    var body: some View {
        // NavigationSplitView gives you:
        // Mac → persistent sidebar + detail panel
        // iPad → collapsible sidebar + detail panel
        // iPhone → full-screen list, taps push to detail
        // One layout, three behaviors. No wrappers needed.
        NavigationSplitView {
            SidebarView(entries: entries, selection: $selectedEntry)
        } detail: {
            if let entry = selectedEntry {
                EditorView(entry: entry)
            } else {
                VStack(spacing: 8) {
                    Text(Constants.Verses.emptyStateVerse)
                        .multilineTextAlignment(.center)
                    
                    Text(Constants.Verses.emptyStateVerseReference)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .font(.title3)
                .foregroundStyle(.tertiary)
                .padding(40)
                .frame(maxWidth: 500)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
