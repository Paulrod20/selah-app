//
//  BibleView.swift
//  Selah
//

import SwiftUI

struct BibleView: View {
    @State private var chapterText: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    // Default to John 3
    @State private var selectedBook: String = "JHN"
    @State private var selectedChapter: String = "3"

    var body: some View {
        NavigationStack {
            ZStack {
                if isLoading {
                    ProgressView("Loading...")
                } else if let error = errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text(error)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    ScrollView {
                        Text(chapterText)
                            .font(.body)
                            .lineSpacing(6)
                            .padding()
                    }
                }
            }
            .navigationTitle("John 3")
            .task {
                await loadChapter()
            }
        }
    }
    
    private func loadChapter() async {
        isLoading = true
        errorMessage = nil
        
        do {
            chapterText = try await BibleService.fetchChapter(
                book: selectedBook,
                chapter: selectedChapter
            )
        } catch {
            errorMessage = "Couldn't load scripture. Check your connection."
            print("Bible API Error:", error) // add this
        }
        
        isLoading = false
    }
}
