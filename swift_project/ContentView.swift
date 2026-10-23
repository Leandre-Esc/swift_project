//
//  ContentView.swift
//  swift_project
//
//  Created by Léandre Escorneboueu on 23/10/2026.
//

import SwiftUI

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var did: Bool = false
}


struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var new_one = ""
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    TextField("New task", text: $new_one)
                    Button("Add") {
                        tasks.append(Task(title: new_one))
                        new_one = ""
                    }
                    .disabled(new_one.isEmpty)
                }
                
                ForEach($tasks) { $task in
                    Toggle(task.title, isOn: $task.did)
                }
                .onDelete { tasks.remove(atOffsets: $0)}
            }
            .navigationTitle("My tasks")
        }
    }
}

#Preview {
    ContentView()
}
