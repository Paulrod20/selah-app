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
            }
            .padding(.horizontal)
            .padding(.top)

            Divider()
                .padding(.vertical, 8)

            // Body field
            ZStack(alignment: .topLeading) {
                if entry.body.isEmpty {
                    Text("What are you feeling?")
                        .font(.body)
                        .foregroundStyle(.tertiary)
                }
                TextField("", text: $entry.body, axis: .vertical)
                    .font(.body)
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
