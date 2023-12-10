//
//  VegetableRowView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 05/11/2023.
//

import SwiftUI

struct VegetableRowView: View {
    
    var vegetable: Vegetable
    
    var body: some View {
        HStack {
            Image(vegetable.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: self.vegetable.gradientColors), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(vegetable.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(vegetable.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            if !self.vegetable.allergens.isEmpty {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                    .overlay(
                        Image(systemName: "allergens")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                    )
            }
        }//: HSTACK
    }
}

#Preview {
    VegetableRowView(vegetable: vegetablesData[0])
        .previewLayout(.sizeThatFits)
        .padding(10)
}
