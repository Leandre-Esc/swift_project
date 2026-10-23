//
//  User.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import Foundation

enum Role: String, CaseIterable, Identifiable {
    case member = "Membre"
    case admin = "Admin"

    var id: Self { self }
}

struct User: Identifiable, Hashable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var password: String
    var role: Role

    var fullName: String { "\(firstName) \(lastName)" }
}
