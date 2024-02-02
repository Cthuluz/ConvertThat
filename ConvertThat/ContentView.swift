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
                        ForEach(vm.items) {
                            Text($0.name)
                        }
                    }
                }
                .foregroundStyle(.black)
                
                Section("Units from") {

                    
                    Picker("Unit from:", selection: $vm.unitFirst) {
                        ForEach(vm.masses + vm.weights + vm.volumes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Unit to:", selection: $vm.unitSecond) {
                        ForEach(vm.masses + vm.weights + vm.volumes, id: \.self) {
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
                
                Button("Calculate") {
                    vm.resultValue = 2.00
                }
            }
            .navigationTitle("ConvertThat")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        vm.calculateResult()
                    }
                }
            }
            .background(Color.teal).opacity(0.6)
            .scrollContentBackground(.hidden)
            .accentColor(Color(red: 0.15, green: 0.43, blue: 0.52))
        }
    }
}

#Preview {
    ContentView()
}
