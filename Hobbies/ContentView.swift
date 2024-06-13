//
//  ContentView.swift
//  Hobbies
//
//  Created by Tim Matlak on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HobbyCell(symbolSF: "paintpalette", headline: "Create", caption: "Make something", background: LinearGradient(gradient: Gradient(colors: [.orange.opacity(0.6), .orange.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                HobbyCell(symbolSF: "figure.walk", headline: "Move", caption: "Get outside", background: LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.6), .purple.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                HobbyCell(symbolSF: "graduationcap", headline: "Practice", caption: "Imrove Skills", background: LinearGradient(gradient: Gradient(colors: [.cyan.opacity(0.6), .cyan.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                HobbyCell(symbolSF: "tv", headline: "Relax", caption: "Zone out", background: LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.6), .blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
            }
            .navigationTitle("Today")
        }
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
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbolSF)
                    .font(.system(size: 33))
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(.headline)
                    Text(caption)
                        .font(.caption)
                }
                Spacer()
            }
            Button {
                
            } label: {
                HStack {
                    Label("Bird Watch", systemImage: "binoculars")
                    Spacer()
                    Stepper("Amount", value: $amount)
                        .labelsHidden()
                        
                }
            }
            .tint(.primary)
            Button {
                
            } label: {
                Label("Add", systemImage: "plus")
                    .padding(.horizontal)
            }
            .buttonBorderShape(.capsule)
            .padding(.top)
            .tint(.secondary)
        }
        .padding()
        .background(background, in: RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .buttonStyle(.bordered)
    }
}
