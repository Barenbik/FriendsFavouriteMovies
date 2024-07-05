//
//  FriendsFavouriteMoviesApp.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 14/06/2024.
//

import SwiftUI
import SwiftData

@main
struct FriendsFavouriteMoviesApp: App {
    var sharedModelContainer: ModelContainer = {
        // This schema adds the included models to the data store of the app.
        let schema = Schema([
            Movie.self,
            Friend.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
