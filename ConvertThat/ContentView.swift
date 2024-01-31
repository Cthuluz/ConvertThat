//
//  ContentView.swift
//  ConvertThat
//
//  Created by Isabel Nelson on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["Flour", "Water", "Milk", "Rice"]
    @State private var item = "Water"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose type:") {
                    Picker("Item:", selection: $item) {
                        ForEach(items, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("ConvertThat")
        }
    }
}

#Preview {
    ContentView()
}
