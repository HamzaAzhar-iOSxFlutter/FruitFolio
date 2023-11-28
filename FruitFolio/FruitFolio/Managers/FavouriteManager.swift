//
//  FavouriteManager.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-11-29.
//

import Foundation

import Foundation

class FavouriteManager: ObservableObject {
    
    @Published var favouriteFruits: [Fruit] = []
    @Published var favouriteVegetables: [Vegetable] = []
    
}
