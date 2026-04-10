//
//  EditorView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI

struct EditorView: View {
    @Bindable var entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title field
            TextField("Title", text: $entry.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top)
            
            Divider()
                .padding(.vertical, 8)
            
            // Body field
            TextField("What are you feeling?", text: $entry.body, axis: .vertical)
                .font(.body)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}
