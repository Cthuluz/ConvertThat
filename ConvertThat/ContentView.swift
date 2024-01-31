//
//  ContentView.swift
//  ConvertThat
//
//  Created by Isabel Nelson on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @FocusState var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose type") {
                    Picker("Item:", selection: $vm.item) {
                        ForEach(vm.items, id: \.self) {
                            Text($0.name)
                        }
                    }
                }
                .foregroundStyle(.black)
                
                Section("Units from") {
                    Picker("From:", selection: $vm.convFirst) {
                        ForEach(vm.convDirs, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Unit:", selection: $vm.unitFirst) {
                        ForEach(vm.masses + vm.weights, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .foregroundStyle(.black)
                
                Section("Units to") {
                    Picker("To:", selection: $vm.convSecond) {
                        ForEach(vm.convDirs, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Unit:", selection: $vm.unitSecond) {
                        ForEach(vm.volumes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .foregroundStyle(.black)
                
                Section("Input") {
                    TextField("Username", value: $vm.amountInput, format: .number.precision(.significantDigits(3)))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                .foregroundStyle(.black)
                
                Section("Result") {
                    Text(String(format: "%.2f", vm.resultValue))
                        .bold()
                }
                .foregroundStyle(.black)
            }
            .navigationTitle("ConvertThat")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            .background(Color.teal).opacity(0.6)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
