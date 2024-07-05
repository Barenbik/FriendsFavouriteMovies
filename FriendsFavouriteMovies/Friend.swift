//
//  Friend.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 05/07/2024.
//

import Foundation
import SwiftData

@Model
final class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Tony"),
        Friend(name: "Raimy"),
        Friend(name: "Lewis"),
        Friend(name: "Tali"),
        Friend(name: "Mabel")
    ]
}
