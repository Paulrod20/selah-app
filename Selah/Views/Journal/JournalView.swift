//
//  JournalView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    @Query private var entries: [JournalEntry]
    @Environment(\.modelContext) private var modelContext
    
    private var selectedTheme: Theme = .frosted
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                selectedTheme.background
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(entries) { entry in
                            NavigationLink(destination: EditorView(entry: entry)) {
                                JournalCardView(entry: entry, theme: selectedTheme)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
                
                //Pencil button - journal tab only
                Button(action: createEntry) {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
                .padding(24)
            }
            .navigationTitle(("Journal"))
        }
    }
    
    private func createEntry() {
        let entry = JournalEntry()
        modelContext.insert(entry)
    }
}
