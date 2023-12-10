//
//  FruitAllergenView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-12-10.
//

import SwiftUI

struct FruitAllergenView: View {
    
    var fruit: Fruit
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Allergens") {
                Text(self.fruit.allergens)
                    .font(Font.system(.body).bold())
                ForEach(self.fruit.allergenSymptoms, id: \.self) { symptom in
                    Divider()
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                        }//: Group
                        .foregroundColor(fruit.gradientColors[1])
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
