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
    
    @State private var showingAddHobby = false
    
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
                Button {
                    showingAddHobby.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHobby) {
                AddView(hobbies: hobbies)
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
