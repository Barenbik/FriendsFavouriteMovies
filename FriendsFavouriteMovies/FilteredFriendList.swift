//
//  FilteredFriendList.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 15/08/2024.
//

// 2. Add filter query to the friends variable
// 3. Create a new FriendList each time a letter is typed
// 4. Bind the search field to the friends field

import SwiftUI

struct FilteredFriendList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            FriendList()
                .searchable(text: $searchText)
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
}

#Preview {
    FilteredFriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
