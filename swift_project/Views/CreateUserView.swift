//
//  CreateUserView.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI

struct CreateUserView: View {
    @Environment(UserStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var role: Role = .member
    
    private var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }
    
    private var isFormValid: Bool {
        !firstName.trimmingCharacters(in: .whitespaces).isEmpty
        && !lastName.trimmingCharacters(in: .whitespaces).isEmpty
        && !username.trimmingCharacters(in: .whitespaces).isEmpty
        && !password.trimmingCharacters(in: .whitespaces).isEmpty
        && isEmailValid
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Identity") {
                    TextField("First name", text: $firstName)
                        .textContentType(.givenName)
                    TextField("Last name", text: $lastName)
                        .textContentType(.familyName)
                    TextField("Username", text: $username)
                        .textContentType(.username)
                }
                Section {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                } header: {
                    Text("Contact")
                } footer: {
                    if !email.isEmpty && !isEmailValid {
                        Text("Email address invalid")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    TextField("Password", text: $password)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                Section("Preferences") {
                    Picker("Roles", selection: $role) {
                        ForEach(Role.allCases) { role in
                            Text(role.rawValue).tag(role)
                        }
                    }
                }
            }
            .navigationTitle("New user")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") { save () }
                        .disabled(!isFormValid)
                }
            }
        }
    }
    
    private func save() {
        let user = User(
            firstName: firstName.trimmingCharacters(in: .whitespaces),
            lastName: lastName.trimmingCharacters(in: .whitespaces),
            username: username.trimmingCharacters(in: .whitespaces),
            email: email.lowercased(),
            password: password.trimmingCharacters(in: .whitespaces),
            role: role
        )
        store.add(user)
        dismiss()
    }
}

#Preview {
    CreateUserView()
        .environment(UserStore())
}
