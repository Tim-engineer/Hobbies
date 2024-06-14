//
//  AddHobby.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var symbolSF = "figure.walk"
    @State private var headline = "Move"
    @State private var caption = ""
    
    var hobbies: Hobbies
    
    @State private var symbols = ["paintpalette", "figure.walk", "graduationcap", "tv"]
    @State private var headlines = ["Create", "Move", "Practice", "Zone out"]
    
    
    var body: some View {
        NavigationStack {
            List {
                
                HStack {
                    Picker("Symbols", selection: $symbolSF) {
                        ForEach(symbols, id: \.self) {
                            Image(systemName: $0)
                        }
                    }
                    Picker("Headlines", selection: $headline) {
                        ForEach(headlines, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .frame(height: 120)
                TextField("Describe it...", text: $caption)
                    .autocorrectionDisabled()
            }
            .pickerStyle(.wheel)
            .navigationTitle("New Hobby")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        let item = HobbyItem(symbolSF: symbolSF, headline: headline, caption: caption)
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
