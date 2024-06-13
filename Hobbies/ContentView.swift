//
//  ContentView.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct HobbyItem: Identifiable {
    let id = UUID()
    
    let name: String
    let time: Double
}

@Observable
class Hobbies {
    var items = [HobbyItem]()
}

struct ContentView: View {
    @State private var hobbies = Hobbies()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hobbies.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Hobbies")
            .toolbar {
                Button("Create Hobby", systemImage: "plus") {
                    let hobby = HobbyItem(name: "Hobby Created...", time: 15)
                    hobbies.items.append(hobby)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        hobbies.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
