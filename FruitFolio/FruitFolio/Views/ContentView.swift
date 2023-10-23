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
    @State private var isShowingSettings: Bool = false
    @State private var category: Category = .fruits
    
    var body: some View {
        VStack {
//            Picker("", selection: $category) {
//                Text("Fruits").tag(Category.fruits)
//                Text("Vegetables").tag(Category.vegetables)
//            }
//            .frame(width: 200)
//            .pickerStyle(.segmented)
//            .padding(10)
            
            switch category {
            case .fruits:
                NavigationView {
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
                    /*
                     This part below, is basically for future improvements.
                     */
                }//: NAVIGATION
                .navigationViewStyle(StackNavigationViewStyle())
            case .vegetables:
                Text("Vegetables")
            }
        }.background(backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
