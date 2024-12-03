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
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
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

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Walk a dog"))
    container.mainContext.insert(Wish(title: "Eat Lemon"))
    container.mainContext.insert(Wish(title: "Start a project"))
    container.mainContext.insert(Wish(title: "Drink coffee"))
    container.mainContext.insert(Wish(title: "Read a book"))
    
    return ContentView()
        .modelContainer(container)
}

// MARK: - Preview
#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
