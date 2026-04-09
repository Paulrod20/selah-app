//
//  JournalEntry.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import SwiftData
import Foundation

@Model
final class JournalEntry {
    var title: String
    var body: String
    var createdAt: Date
    
    init(title: String = "", body: String = "", createdAt: Date = .now) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
    }
}
