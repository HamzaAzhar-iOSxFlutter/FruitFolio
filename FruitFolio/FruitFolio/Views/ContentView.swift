//
//  ContentView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 10/10/2023.
//

import SwiftUI

enum Category {
    case fruits
    case vegetables
}

struct ContentView: View {
    
    let backgroundColor = Color(hex: "#f2f2f7")
    var fruits: [Fruit] = fruitsData
    var vegetables: [Vegetable] = vegetablesData
    @State private var isShowingSettings: Bool = false
    @State private var category: Category = .fruits
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Picker("", selection: $category) {
                    Text("Fruits").tag(Category.fruits)
                    Text("Vegetables").tag(Category.vegetables)
                }
                .frame(width: 200)
                .pickerStyle(.segmented)
                .padding(10)
                
                
                switch category {
                case .fruits:
                    List {
                        ForEach(self.fruits.shuffled()) { item in
                            NavigationLink(destination: FruitDetailView(fruit: item)) {
                                FruitRowView(fruit: item)
                                    .padding(.vertical, 4)
                                
                            }
                            
                        }.background(.clear)
                    }//: LIST
                    .navigationTitle("Fruits")
                    .navigationBarTitleDisplayMode(.large)
                case .vegetables:
                    List {
                        ForEach(self.vegetables.shuffled()) { item in
                            NavigationLink(destination: VegetableDetailView(vegetable: item)) {
                                VegetableRowView(vegetable: item)
                                    .padding(.vertical, 4)
                                
                            }
                        }.background(.clear)
                    }//: LIST
                    .navigationTitle("Vegetables")
                    .navigationBarTitleDisplayMode(.large)
                    
                }
            }.background(backgroundColor)
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData, vegetables: vegetablesData)
    }
}
