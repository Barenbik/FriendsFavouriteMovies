//
//  FriendList.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 05/07/2024.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    @State private var newFriend: Friend?
    
    var body: some View {
        Group {
            if !friends.isEmpty {
                List {
                    ForEach(friends) { friend in
                        NavigationLink {
                            FriendDetail(friend: friend)
                        } label: {
                            Text(friend.name)
                        }
                    }
                    .onDelete(perform: deleteFriends)
                }
            } else {
                ContentUnavailableView {
                    Label("No Friends", systemImage: "person.and.person")
                }
            }
        }
        .navigationTitle("Friends")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            
            ToolbarItem {
                Button(action: addFriend) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newFriend) { friend in
            NavigationStack {
                FriendDetail(friend: friend, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addFriend() {
        withAnimation {
            let newItem = Friend(name: "")
            modelContext.insert(newItem)
            newFriend = newItem
        }
    }
    
    private func deleteFriends(offset: IndexSet) {
        withAnimation {
            for index in offset {
                modelContext.delete(friends[index])
            }
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
