//
//  AddHobby.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct AddView: View {
    @State private var symbolSF = "figure.walk"
    @State private var headline = ""
    @State private var caption = ""
    
    var hobbies: Hobbies
    
    @State private var symbolsSF = ["paintpalette", "figure.walk", "graduationcap", "tv"]
    
    var body: some View {
        NavigationStack {
            List {
                TextField("What you want to do ?", text: $headline)
                TextField("Describe it...", text: $caption)
                Picker("SF", selection: $symbolSF) {
                    ForEach(symbolsSF, id: \.self) {
                        Image(systemName: $0)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 120)
            }
            .navigationTitle("New Hobby")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView(hobbies: Hobbies())
}
