//
//  MovieDetail.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 20/06/2024.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
