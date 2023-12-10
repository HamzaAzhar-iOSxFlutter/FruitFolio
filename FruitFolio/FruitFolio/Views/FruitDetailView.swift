//
//  FruitDetailView.swift
//  FruitFolio
//
//  Created by Daniyal Siddiqui on 2023-10-23.
//

import SwiftUI

struct FruitDetailView: View {
    
    @State var fruit: Fruit
    @ObservedObject var favouriteManager: FavouriteManager
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //HEADER
                    
                    FruitHeaderView(fruit: fruit)
                    VStack(alignment: .leading, spacing: 20) {
                        //TITLE
                        HStack {
                            Text(self.fruit.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(fruit.gradientColors[1])
                            Spacer()
                            Button(action: {
                                if self.fruit.isFavourite {
                                    if let index = self.favouriteManager.favouriteFruits.firstIndex(where: { $0.id == self.fruit.id }) {
                                        self.favouriteManager.favouriteFruits.remove(at: index)
                                    }
                                } else {
                                    self.favouriteManager.favouriteFruits.append(self.fruit)
                                }
                                
                                // Toggle favorite status
                                self.fruit.isFavourite.toggle()
                            }, label: {
                                switch self.fruit.isFavourite {
                                case true:
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                case false:
                                    Image(systemName: "heart")
                                        .foregroundColor(.secondary)
                                        .font(.title)
                                }
                            })
                        }
                        //HEADLINE
                        Text(self.fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        //NUTRIENTS
                        NutrientsDetailView(fruit: fruit)
                        
                        FruitAllergenView(fruit: self.fruit)
                        
                        //SUBHEADLINE
                        Text("Learn more about \(self.fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(self.fruit.gradientColors[1])
                        
                        
                        //DESCRIPTION
                        Text(self.fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        //LINK
                        SourceLinkView()
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
