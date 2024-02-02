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
        let convDict = ["mg":1000, "g":1, "kg":0.001, "oz":16, "lb":1, "ml":1, "L":0.001, "fl oz":0.033814, "tsp":0.202884, "Tbsp":0.067628, "cup":0.00416667, "pint":0.00211338, "quart":0.00105669, "gallon":0.000264172]
        
        // Input and output variables
        @Published var amountInput = 0.00
        @Published var resultValue = 0.00
        
        init() {
            self.items.append(Item(name: "Water", density: 1))
            self.items.append(Item(name: "Wheat Flour", density: 0.593))
            self.items.append(Item(name: "Butter", density: 0.96))
            
            item = items[0]
        }
        
        func calculateResult() {
            var modifyValue = 0.00
            
            if masses.contains(unitFirst) {
                if masses.contains(unitSecond) {
                    modifyValue = convDict[unitSecond]!/convDict[unitFirst]!
                    resultValue = modifyValue * amountInput
                } else if weights.contains(unitSecond) {
                    resultValue = 2
                } else { // unitSecond is volume
                    resultValue = 2
                }
            } else if weights.contains(unitFirst) {
                if masses.contains(unitSecond) {
                    resultValue = 2
                } else if weights.contains(unitSecond) {
                    modifyValue = convDict[unitSecond]!/convDict[unitFirst]!
                    resultValue = modifyValue * amountInput
                } else { // unitSecond is volume
                    resultValue = 2
                }
            } else { // unitFirst is a volume
                if masses.contains(unitSecond) {
                    resultValue = 2
                } else if weights.contains(unitSecond) {
                    resultValue = 2
                } else { // unitSecond is volume
                    modifyValue = convDict[unitSecond]!/convDict[unitFirst]!
                    resultValue = modifyValue * amountInput
                }
            }
        }
    }
}
