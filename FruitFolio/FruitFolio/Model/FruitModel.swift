//
//  FruitModel.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 21/10/2023.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var isFavourite: Bool
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
    var allergens: String
    var allergenSymptoms: [String]
}
