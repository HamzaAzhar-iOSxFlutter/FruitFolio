//
//  VegetableModel.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 04/11/2023.
//

import SwiftUI

struct Vegetable: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
