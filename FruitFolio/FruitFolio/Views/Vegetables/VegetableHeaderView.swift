//
//  VegetableHeaderView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 04/11/2023.
//

import SwiftUI

struct VegetableHeaderView: View {
    @State private var isAnimatingImage: Bool = false
    let vegetable: Vegetable
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: self.vegetable.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(self.vegetable.image)
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
    VegetableHeaderView(vegetable: vegetablesData[0])
        .previewLayout(.fixed(width: 375, height: 440))
}
