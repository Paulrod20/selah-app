//
//  EditorView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI
import SwiftData

struct EditorView: View {
    @Bindable var entry: JournalEntry
    @FocusState private var isTitleFocused: Bool
    @Environment(\.modelContext) private var modelContext
    
    private var wordCount: Int {
        entry.body.split(separator: " ").count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title field
            ZStack(alignment: .leading) {
                if entry.title.isEmpty {
                    Text("Title")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                }
                TextField("", text: $entry.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .focused($isTitleFocused)
                    .onChange(of: entry.title) {
                        entry.updatedAt = .now
                    }
            }
            .padding(.horizontal)
            .padding(.top)

            Divider()
                .padding(.vertical, 8)
            
            // Metadata row
            HStack(spacing: 4) {
                Text(entry.createdAt.formatted(date: .long, time: .omitted))
                Text("•")
                Text("\(wordCount) words")
                Text("•")
                Text("Edited \(entry.updatedAt.formatted(.relative(presentation: .named)))")
            }
            .font(.caption)
            .foregroundStyle(.tertiary)
            .padding(.horizontal)
            .padding(.bottom, 8)

            // Body field
            ZStack(alignment: .topLeading) {
                if entry.body.isEmpty {
                    Text("What are you feeling?")
                        .font(.body)
                        .foregroundStyle(.tertiary)
                }
                TextField("", text: $entry.body, axis: .vertical)
                    .font(.body)
                    .onChange(of: entry.body) {
                        entry.updatedAt = .now
                    }
            }
            .padding(.horizontal)

            Spacer()
        }
        
        .onAppear {
            if entry.title.isEmpty {
                isTitleFocused = true
            }
        }
        .onDisappear {
            try? modelContext.save()
        }
    }
}
