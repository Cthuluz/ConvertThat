//
//  Content-ViewModel.swift
//  ConvertThat
//
//  Created by Isabel Nelson on 1/31/24.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        // Item object and list of Item objects
        @Published var item = Item(name: "Water", density: 1)
        @Published var items = [Item]()
        
        // Selected type and list of measurement types
        @Published var convFirst = "Weight"
        @Published var convSecond = "Weight"
        @Published var convDirs = ["Weight", "Mass", "Volume"]
        
        // Selected conversion units
        @Published var unitFirst = "mg"
        @Published var unitSecond = "oz"
        
        // Conversion unit arrays
        @Published var masses = ["mg", "g", "kg"]
        @Published var weights = ["oz", "lb"]
        @Published var volumes = ["ml", "L", "fl oz", "tsp", "Tbsp", "cup", "pint", "quart", "gallon"]
        
        // Input and output variables
        @Published var amountInput = 0.00
        @Published var resultValue = 0.00
        
        init() {
            self.items.append(Item(name: "Water", density: 1))
            self.items.append(Item(name: "Wheat Flour", density: 0.593))
            self.items.append(Item(name: "Butter", density: 0.96))
        }
    }
}
