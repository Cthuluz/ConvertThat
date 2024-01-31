//
//  ItemModel.swift
//  ConvertThat
//
//  Created by Isabel Nelson on 1/31/24.
//

import Foundation

struct Item {
    private(set) var name: String
    private(set) var density: Double
    
    init(name: String, density: Double) {
        self.name = name
        self.density = density
    }
}
