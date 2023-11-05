//
//  VegetableDetailView.swift
//  FruitFolio
//
//  Created by Hamza Azhar on 04/11/2023.
//

import SwiftUI

struct VegetableDetailView: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //HEADER
                    
                    VegetableHeaderView(vegetable: vegetable)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        //TITLE
                        Text(self.vegetable.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(vegetable.gradientColors[1])
                        //HEADLINE
                        Text(self.vegetable.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        //NUTRIENTS
                       /*
                        The nutrient group should be placed here
                        */
                            
                        //SUBHEADLINE
                        Text("Learn more about \(self.vegetable.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(self.vegetable.gradientColors[1])
                        
                        
                        //DESCRIPTION
                        Text(self.vegetable.description)
                            .multilineTextAlignment(.leading)
                        
                        //LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }//: VSTACK
                    .padding(20)
                    .frame(maxWidth: 640, alignment: .center)
                }//: VSTACK
                .navigationBarTitle(self.vegetable.title, displayMode: .inline)
                .navigationBarHidden(true)
            }//: SCROLLVIEW
            .edgesIgnoringSafeArea(.top)
        }//: NAVIGATIONVIEW
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


#Preview {
    VegetableDetailView(vegetable: vegetablesData[0])
}
