//
//  UserDetailView.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Identity") {
                LabeledContent("First name", value: user.firstName)
                LabeledContent("Last name", value: user.lastName)
                LabeledContent("Username", value: user.username)
            }
            Section("Contact") {
                LabeledContent("Email", value: user.email)
            }
            Section {
                LabeledContent("Password", value: user.password)
            }
            Section("Preferences") {
                LabeledContent("Role", value: user.role.rawValue)
            }
        }
        .navigationTitle(user.fullName)
    }
}
