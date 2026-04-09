//
//  Item.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/9/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
