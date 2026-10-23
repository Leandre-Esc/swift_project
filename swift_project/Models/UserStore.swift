//
//  UserStore.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI
import Observation
import Foundation

@Observable
final class UserStore {
    var users: [User] = []

    func add(_ user: User) {
        users.append(user)
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
