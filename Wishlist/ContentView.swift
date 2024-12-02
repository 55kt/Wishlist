//
//  ContentView.swift
//  Wishlist
//
//  Created by Vlad on 1/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            } //: List
            .navigationTitle("Wishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started."))             }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
