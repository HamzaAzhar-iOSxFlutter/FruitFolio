//
//  VegetableAllergenView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-12-10.
//

import SwiftUI

import SwiftUI

struct VegetableAllergenView: View {
    
    var vegetable: Vegetable
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Allergens") {
                Text(self.vegetable.allergens)
                    .font(Font.system(.body).bold())
                ForEach(self.vegetable.allergenSymptoms, id: \.self) { symptom in
                    Divider()
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                        }//: Group
                        .foregroundColor(self.vegetable.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Text(symptom)
                            .multilineTextAlignment(.trailing)
                            .font(Font.system(.body).bold())
                        Spacer()
                    }//: HStack
                }
            }
        }//: DisclosureGroup
    }//: GroupBox
}
