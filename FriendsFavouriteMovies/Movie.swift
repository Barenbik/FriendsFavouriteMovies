//
//  Movie.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 14/06/2024.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
