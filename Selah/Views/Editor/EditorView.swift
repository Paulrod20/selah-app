//
//  EditorView.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftUI

struct EditorView: View {
    let entry: JournalEntry?
    
    var body: some View {
        Text(entry?.title ?? "Select an entry")
    }
}
