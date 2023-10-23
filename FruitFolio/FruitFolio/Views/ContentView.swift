//
//  ContentView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.fruits.shuffled()) { item in
//                    NavigationLink(destination: FruitDetailView(fruit: item)) {
//                        FruitRowView(fruit: item)
//                            .padding(.vertical, 4)
//                    }
                }
            }//: LIST
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.large)
            /*
             The commented code below, is basically for future improvements.
             */
//            .navigationBarItems(
//                trailing:
//                    Button(action: {
//                        self.isShowingSettings = true
//                    }) {
//                        Image(systemName: "slider.horizontal.3")
//                    }//: Button
//                    .sheet(isPresented: $isShowingSettings) {
//                        SettingsView()
//                    }
//            )
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
