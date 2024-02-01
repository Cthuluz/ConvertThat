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
        
        // Selected conversion units
        @Published var unitFirst = "mg"
        @Published var unitSecond = "oz"
        
        // Conversion unit arrays
        @Published var masses = ["mg", "g", "kg"]
        @Published var weights = ["oz", "lb"]
        @Published var volumes = ["ml", "L", "fl oz", "tsp", "Tbsp", "cup", "pint", "quart", "gallon"]
        
        // Conversion dictionary
        let convDict = ["mg":1000, "g":1, "kg":0.001, "oz":16, "lb":1, "ml":1, "L":0.001, "fl oz":0.0338, "tsp":0.2028, "Tbsp":0.0676, "cup":0.00417, "pint":0.00211, "quart":0.00106, "gallon":0.00026]
        
        // Input and output variables
        @Published var amountInput = 0.00
        @Published var resultValue = 0.00
        
        init() {
            self.items.append(Item(name: "Water", density: 1))
            self.items.append(Item(name: "Wheat Flour", density: 0.593))
            self.items.append(Item(name: "Butter", density: 0.96))
        }
        
        func calculateResult() {
            resultValue = 2
        }
    }
}
