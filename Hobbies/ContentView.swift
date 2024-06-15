//
//  ContentView.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct HobbyItem: Identifiable, Codable {
    var id = UUID()
    
    let symbolSF: String
    let headline: String
    let caption: String
}

@Observable
class Hobbies {
    var items = [HobbyItem]() {
        //new did set property observer
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HobbyItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var hobbies = Hobbies()
    
    @State private var showingAddHobby = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hobbies.items) { item in
                    
                    createHobbyCell(for: item)
                    
                }
                .onDelete(perform: removeItems)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Hobbies")
            .toolbar {
                Button {
                    showingAddHobby.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
                .tint(.primary)
            }
            .sheet(isPresented: $showingAddHobby) {
                AddView(hobbies: hobbies)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        hobbies.items.remove(atOffsets: offsets)
    }
    
    func createHobbyCell(for item: HobbyItem) -> HobbyCell {
        var gradientColors: [Color]
        
        switch item.headline {
        case "Create":
            gradientColors = [.orange.opacity(0.6), .orange.opacity(0.2)]
        case "Move":
            gradientColors = [.purple.opacity(0.6), .purple.opacity(0.2)]
        case "Practice":
            gradientColors = [.cyan.opacity(0.6), .cyan.opacity(0.2)]
        case "Zone out":
            gradientColors = [.indigo.opacity(0.6), .indigo.opacity(0.2)]
        default:
            gradientColors = [.purple.opacity(0.6), .purple.opacity(0.2)]
        }
        
        return HobbyCell(
            symbolSF: item.symbolSF,
            headline: item.headline,
            caption: item.caption,
            background: LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    ContentView()
}

struct HobbyCell: View {
    let symbolSF: String
    let headline: String
    let caption: String
    let background: LinearGradient
    
    @State private var amount = 0.0
    
    @State private var isShowingSpecificAdd = false
    
    @State private var animationRunning = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbolSF)
                    .symbolEffect(.pulse, options: .repeat(4), value: animationRunning)
                    .font(.system(size: 33))
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(.headline)
                    Text(caption)
                        .font(.caption)
                }
                Spacer()
                Button {
                    isShowingSpecificAdd.toggle()
                    animationRunning.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                    }
                }
                .buttonBorderShape(.capsule)
                .tint(.secondary)
            }
            
//            Button {
//                
//            } label: {
//                HStack {
//                    Label("Bird Watch", systemImage: "binoculars")
//                    Spacer()
//                    Stepper("Amount", value: $amount)
//                        .labelsHidden()
//                        
//                }
//            }
//            .foregroundStyle(.primary)
//            .padding(.vertical)
        }
        .padding()
        .background(background, in: RoundedRectangle(cornerRadius: 20))
        .buttonStyle(.bordered)
        .sheet(isPresented: $isShowingSpecificAdd) {
            SpecificAddView()
                .presentationDetents([.medium])
        }
    }
}
