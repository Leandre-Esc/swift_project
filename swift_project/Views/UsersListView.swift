//
//  UsersListView.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI

struct UsersListView: View {
    @Environment(UserStore.self) private var store
    @State private var showCreateForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.users) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading) {
                            Text(user.fullName)
                                .font(.headline)
                            Text(user.username)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: store.delete)
            }
            .overlay {
                if store.users.isEmpty {
                    ContentUnavailableView(
                        "None users",
                        systemImage: "person.crop.circle.badge.plus",
                        description: Text("Touch + to create one")
                    )
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showCreateForm = true
                }
            }
            .sheet(isPresented: $showCreateForm) {
                CreateUserView()
            }
        }
    }
}

#Preview {
    UsersListView()
        .environment(UserStore())
}
