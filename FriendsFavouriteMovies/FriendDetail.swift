//
//  FriendDetail.swift
//  FriendsFavouriteMovies
//
//  Created by Tony Sharples on 05/07/2024.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Friend name", text: $friend.name)
        }
        .navigationTitle("Friend")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
}
