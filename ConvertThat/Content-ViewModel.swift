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
        @Published var item = "Water"
        @Published var items = ["Flour", "Water", "Milk", "Rice"]
    }
}
