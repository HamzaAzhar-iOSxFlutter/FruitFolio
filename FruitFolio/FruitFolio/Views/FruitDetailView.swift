//
//  FruitDetailView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-10-23.
//

import SwiftUI

struct FruitDetailView: View {
    
    let fruit: Fruit
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //HEADER
                    
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        //TITLE
                        Text(self.fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        //HEADLINE
                        Text(self.fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        //NUTRIENTS
                        //NutrientsDetailView(fruit: fruit)
                            
                        //SUBHEADLINE
                        Text("Learn more about \(self.fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(self.fruit.gradientColors[1])
                        
                        
                        //DESCRIPTION
                        Text(self.fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        //LINK
                       // SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }//: VSTACK
                    .padding(20)
                    .frame(maxWidth: 640, alignment: .center)
                }//: VSTACK
                .navigationBarTitle(self.fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }//: SCROLLVIEW
            .edgesIgnoringSafeArea(.top)
        }//: NAVIGATIONVIEW
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    FruitDetailView(fruit: fruitsData[0])
}
