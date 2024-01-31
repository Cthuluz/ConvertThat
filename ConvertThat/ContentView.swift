//
//  ContentView.swift
//  ConvertThat
//
//  Created by Isabel Nelson on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose type:") {
                    Picker("Item:", selection: $vm.item) {
                        ForEach(vm.items, id: \.self) {
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
