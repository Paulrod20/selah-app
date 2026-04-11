//
//  Tab.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/11/26.
//

import Foundation

enum Tab {
    case journal
    case bible
    case stats
    
    var label: String {
        switch self {
        case .journal: return "Journal"
        case .bible: return "Bible"
        case .stats: return "Stats"
        }
    }
}


