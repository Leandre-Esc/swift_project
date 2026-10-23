//
//  swift_projectApp.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI

@main
struct swift_projectApp: App {
    @State private var store = UserStore()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                UsersListView()
            }
            .environment(store)
        }
    }
}
