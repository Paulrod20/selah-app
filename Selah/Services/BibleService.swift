//
//  BibleService.swift
//  Selah
//

import Foundation

// This is our API service — think of it like a custom hook in React
// that handles all fetch calls to the Bible API
struct BibleService {
    
    // NIV Bible ID on API.Bible
    private static let bibleId = "78a9f6124f344018-01"
    private static let baseURL = "https://rest.api.bible/v1"
    
    // Fetch a specific chapter
    // Example: book = "JHN", chapter = "3"
    static func fetchChapter(book: String, chapter: String) async throws -> String {
        let chapterId = "\(book).\(chapter)"
        let urlString = "\(baseURL)/bibles/\(bibleId)/chapters/\(chapterId)?content-type=text&include-notes=false&include-titles=true&include-chapter-numbers=false&include-verse-numbers=true&include-verse-spans=false"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(APIConfig.bibleAPIKey, forHTTPHeaderField: "api-key")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let response = try JSONDecoder().decode(BibleResponse.self, from: data)
        return response.data.content
    }
}

// The shape of the API response — like a TypeScript interface
struct BibleResponse: Codable {
    let data: BibleChapter
}

struct BibleChapter: Codable {
    let content: String
}
