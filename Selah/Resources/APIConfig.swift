//
//  APIConfig.swift
//  Selah
//
//  Created by Paul Rodriguez on 4/13/26.
//
import Foundation

enum APIConfig {
    static let bibleAPIKey = Bundle.main.infoDictionary?["API_BIBLE_KEY"] as? String ?? ""
}
