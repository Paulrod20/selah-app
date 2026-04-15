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

    var body: some View {
        TabView {
            TabSection("Journal") {
                Tab("All Entries", systemImage: "square.grid.2x2") {
                    JournalView()
                }
                ForEach(entries) { entry in
                    Tab(entry.title.isEmpty ? "Untitled" : entry.title, systemImage: "doc.text") {
                        EditorView(entry: entry)
                    }
                }
            }

            TabSection("Bible") {
                Tab("Read", systemImage: "book.pages") {
                        BibleView()
                    }
                
                Tab("Bookmarks", systemImage: "bookmark") {
                    Text("Bookmarks coming soon")
                }
                Tab("Highlights", systemImage: "highlighter") {
                    Text("Highlights coming soon")
                }
                Tab("Notes", systemImage: "note.text") {
                    Text("Bible notes coming soon")
                }
            }

            TabSection("Stats") {
                Tab("Overview", systemImage: "chart.bar") {
                    Text("Stats coming soon")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
