//
//  FilteredMovieList.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 01/08/2024.
//

import SwiftUI

struct FilteredMovieList: View {
    @State private var searchText = ""
    @State private var sortByRelease = false
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText, sortByRelease: sortByRelease)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Toggle("Sort by release date", isOn: $sortByRelease)
                            .toggleStyle(.switch)
                    }
                }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
