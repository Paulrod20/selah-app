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
    var updatedAt: Date
    
    init(title: String = "", body: String = "", createdAt: Date = .now, updatedAt: Date = .now) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
