//
//  AddHobby.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedSymbolHeadline = SymbolHeadlineItem(symbolSF: "paintpalette", headline: "Create")
    @State private var caption = ""
    
    var hobbies: Hobbies
    
    let symbolHeadlineItems = [
        SymbolHeadlineItem(symbolSF: "paintpalette", headline: "Create"),
        SymbolHeadlineItem(symbolSF: "figure.walk", headline: "Move"),
        SymbolHeadlineItem(symbolSF: "graduationcap", headline: "Practice"),
        SymbolHeadlineItem(symbolSF: "tv", headline: "Zone out")
    ]
    
    
    var body: some View {
        List {
            Picker("SF Symbols", selection: $selectedSymbolHeadline) {
                ForEach(symbolHeadlineItems) { item in
                    HStack {
                        Image(systemName: item.symbolSF)
                            .frame(width: 30, height: 30)
                        Text(item.headline)
                    }
                    .foregroundStyle(foregroundColor(for: item.headline).gradient)
                    .fontWeight(.semibold)
                }
            }
            .pickerStyle(.wheel)
            
            TextField("Describe it...", text: $caption)
        }
        .scrollDisabled(true)
        .listStyle(.plain)
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
    
    func foregroundColor(for headline: String) -> Color {
            switch headline {
            case "Create": return .orange
            case "Move": return .purple
            case "Practice": return .cyan
            case "Zone out": return .indigo
            default: return .black
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
