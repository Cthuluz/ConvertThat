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
        @Published var item = Item(name: "Water", density: 1)
        @Published var items = [Item]()
        
        init() {
            self.items.append(Item(name: "Water", density: 1))
            self.items.append(Item(name: "Wheat Flour", density: 0.593))
            self.items.append(Item(name: "Butter", density: 0.96))
        }
    }
}
