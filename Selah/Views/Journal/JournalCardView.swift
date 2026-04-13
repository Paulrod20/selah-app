//
//  JournalCardView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/13/26.
//

import SwiftUI

struct JournalCardView: View {
    let entry : JournalEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entry.createdAt.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(entry.title.isEmpty ? "Untitled" : entry.title)
                .font(.headline)
                .lineLimit(2)
            
            Text(entry.body.isEmpty ? " " : entry.body)
                .font(.headline)
                .lineLimit(4)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180, alignment: .topLeading)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
        .hoverEffect(.lift)
    }
}
