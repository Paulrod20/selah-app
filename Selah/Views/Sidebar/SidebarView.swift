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
        List(entries, selection: $selection) { entry in
            ForEach(entries) { entry in
                Text(entry.title.isEmpty ? "Untitled" : entry.title)
                    .tag(entry) // tells List which item this row represents
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
            modelContext.delete(entries[index])
        }
    }
}
