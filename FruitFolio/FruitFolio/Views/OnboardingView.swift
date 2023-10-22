//
//  OnboardingView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 21/10/2023.
//

import SwiftUI

struct OnboardingView: View {
    var fruits: [Fruit] = fruitsData
    var body: some View {
        TabView {
            ForEach(fruits[0...10]) { item in
                FruitCardView(fruit: item)
            }//: LOOP
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 50)
    }
}

#Preview {
    OnboardingView()
}
