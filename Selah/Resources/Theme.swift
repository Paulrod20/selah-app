//
//  Theme.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/13/26.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case parchment
    case frosted
    
    var label: String {
        switch self {
            case .parchment: return "Parchment"
            case .frosted: return "Frosted"
        }
    }
    
    var background: Color {
        switch self {
            case .parchment: return Color(red: 0.98, green: 0.96, blue: 0.92)
            case .frosted: return Color(red: 0.94, green: 0.94, blue: 0.95)
        }
    }
    
    var cardBackground: Color {
        switch self {
            case .parchment: return Color(red: 1.0, green: 0.98, blue: 0.95)
            case .frosted: return Color.white.opacity(0.7)
        }
    }
    
    var primaryText: Color { .primary }
    var secondaryText: Color { .secondary }
}

