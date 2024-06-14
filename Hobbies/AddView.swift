//
//  AddHobby.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedSymbolHeadline = SymbolHeadlineItem(symbolSF: "figure.walk", headline: "Move")
    @State private var caption = ""
    
    var hobbies: Hobbies
    
    let symbolHeadlineItems = [
            SymbolHeadlineItem(symbolSF: "paintpalette", headline: "Create"),
            SymbolHeadlineItem(symbolSF: "figure.walk", headline: "Move"),
            SymbolHeadlineItem(symbolSF: "graduationcap", headline: "Practice"),
            SymbolHeadlineItem(symbolSF: "tv", headline: "Zone out")
        ]
    
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Picker("SF Symbols", selection: $selectedSymbolHeadline) {
                                        ForEach(symbolHeadlineItems) { item in
                                            HStack {
                                                Image(systemName: item.symbolSF)
                                                    .frame(width: 30, height: 30)
                                                Text(item.headline)
                                            }
                                            .tag(item)
                                        }
                                    }
                }
                .frame(height: 120)
                TextField("Describe it...", text: $caption)
            }
            .pickerStyle(.wheel)
            .navigationTitle("New Hobby")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        let item = HobbyItem(symbolSF: selectedSymbolHeadline.symbolSF, headline: selectedSymbolHeadline.headline, caption: caption)
                        hobbies.items.append(item)
                        dismiss()
                    }
                    .tint(.green)
                }
            }
        }
    }
}

#Preview {
    AddView(hobbies: Hobbies())
}

struct SymbolHeadlineItem: Identifiable, Hashable {
    let id = UUID()
    let symbolSF: String
    let headline: String
}
