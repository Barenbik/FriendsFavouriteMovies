//
//  MovieDetail.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 20/06/2024.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend] {
        // The trailing closure compares the first item to the second item and returns true or false depending on if first name is before second name alphabetically.
        movie.favouritedBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favouritedBy.isEmpty {
                Section("Favourited by") {
                    List {
                        ForEach(sortedFriends) { friend in
                            Text(friend.name)
                        }
                        .onDelete(perform: deleteFavouriteMovieForFriend)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func deleteFavouriteMovieForFriend(offset: IndexSet) {
        withAnimation {
            for index in offset {
                sortedFriends[index].favouriteMovie = nil
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
