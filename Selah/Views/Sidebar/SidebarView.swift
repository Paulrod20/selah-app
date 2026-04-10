//
//  SidebarView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI
import SwiftData

struct SidebarView: View {
    let entries: [JournalEntry]
    @Binding var selection: JournalEntry?
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List(selection: $selection) {
            ForEach(entries) { entry in
                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.title.isEmpty ? "Untitled" : entry.title)
                        .font(.body)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    
                    HStack(spacing: 4) {
                        Text(entry.createdAt.formatted(date: .abbreviated, time: .omitted))
                        
                        if !entry.body.isEmpty {
                            Text("•")
                            Text(entry.body)
                                .lineLimit(1)
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
                .tag(entry)
            }
            .onDelete(perform: deleteEntry)
        }
        .navigationTitle("Selah")
        .overlay{
            if entries.isEmpty {
                ContentUnavailableView(
                    "No entries yet",
                    systemImage: "book.closed",
                    description: Text("Your journal entries will appear here.")
                )
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                Button(action: createEntry) {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
    }
    
    private func createEntry() {
        let entry = JournalEntry()
        modelContext.insert(entry)
        selection = entry
    }
    
    private func deleteEntry(offsets: IndexSet) {
        for index in offsets {
            if selection == entries[index] {
                selection = nil
            }
            modelContext.delete(entries[index])
        }
    }
}
