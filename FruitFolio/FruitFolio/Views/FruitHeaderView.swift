//
//  FruitHeaderView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-10-23.
//

import SwiftUI

struct FruitHeaderView: View {
    
    @State private var isAnimatingImage: Bool = false
    let fruit: Fruit
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: self.fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(self.fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(self.isAnimatingImage ? 1.0 : 0.6)
        }//: ZSTACK
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut) {
                self.isAnimatingImage = true
            }
        }
    }
}

#Preview {
    FruitHeaderView(fruit: fruitsData[0])
        .previewLayout(.fixed(width: 375, height: 440))
}
