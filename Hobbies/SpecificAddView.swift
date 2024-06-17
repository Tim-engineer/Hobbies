//
//  SpecificAddView.swift
//  Hobbies
//
//  Created by Tim Matlak on 15/06/2024.
//

import SwiftUI

struct SpecificAddView: View {
    
    @State private var what = ""
    @State private var deadline = Calendar.current.date(bySetting: .minute, value: 0, of: Date.now) ?? Date.now
    
    var body: some View {
        List {
            TextField("Enter what you need to do", text: $what)
            
            Section("Deadline") {
                DatePicker("Deadline", selection: $deadline, displayedComponents: [.date ,.hourAndMinute])
                    .labelsHidden()
                    .datePickerStyle(.wheel)
            }
        }
        .navigationTitle("New")
    }
}

#Preview {
    SpecificAddView()
}
